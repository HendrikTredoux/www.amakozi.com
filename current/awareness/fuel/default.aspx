<%@ page language="C#" autoeventwireup="true" inherits="fuel_default, App_Web_ytcdre3q" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
    <meta name="description" content="Fuel Comparison by Amakozi Technologies" />
    <meta name="keywords" content="amakozi, technology, technologies, fuel, compare, comparison, usa, sa, rsa, fuel compare, south africa, petrol compare" />
    <meta name="norton-safeweb-site-verification" content="ovzx485i46mqecb76cr5tyfra9g9-xfblgrse-8tcxh2y71qx9jqnbwk2995s3x9cp-ofm-mcx91i8h-7jj-spws9yaelixktcy9cu45udjmow3czo3570-redm0w0e7" />
    <link rel="stylesheet" href="style.css" type="text/css" />
    <title>Fuel Comparison by Amakozi Technologies</title>
</head>
<body>
    <form id="form1" runat="server">
    <%
        /**
         * Use Max Mind Lite Geo Database to check if we can see where the user is coming from
         * Maxmind.
         * 
         * The Database is in Binary format at GeoIP.dat. This contains all the records used to determine the location.
         **/
        LookupService ls = new LookupService(Server.MapPath("~/awareness/fuel/GeoIP.dat"), LookupService.GEOIP_MEMORY_CACHE);
        
        /**
         * Look at which company this user is from.
         * 
         * We first check for South-Africa then show Rand
         * else we check for United States then we go Dollar
         * else we go with Euro.
         **/
        Country current_country = null; // What else :P
        try
        {
            current_country = ls.getCountry(Request.UserHostAddress);
        }
        catch (Exception) { /* Default would be Europe */ }

        String country_code = "eu";
        if (current_country != null && current_country.getCode().ToLower() == "za") country_code = "sa";
        else if (current_country != null && current_country.getCode().ToLower() == "us") country_code = "us";

        /**
         * Configuration Options for the Price of fuel in the seperate countries:
         * -> us_cal_price_gallon = Price per Gallon in California, United States
         * 
         * -> sa_coastal_cpt_price_liter = Price per liter in South-Africa's Coastel Region
         * -> sa_gauteng_cpt_price_liter = Price per liter in South-Africa's Gauteng Region
         * 
         * -> eu_france_price_liter = Price per liter in Franch, Europe
         * -> eu_italy_price_liter = Price per liter in Italy, Europe
         * -> eu_netherlands_price_liter = Price per liter in Netherlands, Europe
         * -> eu_germany_price_liter = Price per liter in Germany, Europe
         **/
        decimal us_cal_price_gallon = 3.39M;

        decimal sa_coastal_cpt_price_liter = 10.36M;
        decimal sa_gauteng_cpt_price_liter = 10.51M;

        decimal eu_france_price_liter = 1.5M;
        decimal eu_italy_price_liter = 1.5M;
        decimal eu_netherlands_price_liter = 1.5M;
        decimal eu_germany_price_liter = 1.5M;

        /**
         * When the default Values were added
         **/
        DateTime fuel_price_timestamp = new DateTime(2012, 02, 03);

        /**
         * Used to Parse JSON
         **/
        System.Web.Script.Serialization.JavaScriptSerializer srr = new System.Web.Script.Serialization.JavaScriptSerializer();

        /**
         * Check if the Configuration File Exists
         **/
        String PRICE_RATES_FILENAME = "fuel_prices.json";
        if (System.IO.File.Exists(Server.MapPath(PRICE_RATES_FILENAME)))
        {
            try
            {
                String fuel_price_contents = System.IO.File.ReadAllText(Server.MapPath(PRICE_RATES_FILENAME)); // Our File to Read for Config

                Dictionary<String, Object> fuel_price_output = (Dictionary<String, Object>)srr.Deserialize(fuel_price_contents, typeof(Dictionary<String, Object>));

                // Fill in those detail
                us_cal_price_gallon = Decimal.Parse(fuel_price_output["us_cal_price_gallon"].ToString());

                sa_coastal_cpt_price_liter = Decimal.Parse(fuel_price_output["sa_coastal_cpt_price_liter"].ToString());
                sa_gauteng_cpt_price_liter = Decimal.Parse(fuel_price_output["sa_gauteng_cpt_price_liter"].ToString());

                eu_france_price_liter = Decimal.Parse(fuel_price_output["eu_france_price_liter"].ToString());
                eu_italy_price_liter = Decimal.Parse(fuel_price_output["eu_italy_price_liter"].ToString());
                eu_netherlands_price_liter = Decimal.Parse(fuel_price_output["eu_netherlands_price_liter"].ToString());
                eu_germany_price_liter = Decimal.Parse(fuel_price_output["eu_germany_price_liter"].ToString());

                // Try to parse the Timestpan ...
                if (!DateTime.TryParse(fuel_price_output["timestamp"].ToString(), out fuel_price_timestamp))
                {
                    // Well this failed ... , we just use the default hard coded values
                }
            }
            catch (Exception ex)
            {
                // Well nothing to do here. We just use the Hard Coded Values then
                Response.Write(ex.Message);
            }
        }

        /**
         * Work out the price of a liter from the gallons
         * 
         * -> us_cal_price_liter = Price per Liter in California, United States
         * 
         * -> sa_coastal_cpt_price_gallon = Price per gallon in South-Africa's Coastel Region
         * -> sa_gauteng_cpt_price_gallon = Price per gallon in South-Africa's Gauteng Region
         * 
         * -> eu_france_price_gallon = Price per gallon in Franch, Europe
         * -> eu_italy_price_gallon = Price per gallon in Italy, Europe
         * -> eu_netherlands_price_gallon = Price per gallon in Netherlands, Europe
         * -> eu_germany_price_gallon = Price per gallon in Germany, Europe
         **/
        decimal us_cal_price_liter = us_cal_price_gallon / 3.7854M;

        decimal sa_coastal_cpt_price_gallon = sa_coastal_cpt_price_liter * 3.7854M;
        decimal sa_gauteng_cpt_price_gallon = sa_gauteng_cpt_price_liter * 3.7854M;

        decimal eu_france_price_gallon = eu_france_price_liter * 3.7854M;
        decimal eu_italy_price_gallon = eu_italy_price_liter * 3.7854M;
        decimal eu_netherlands_price_gallon = eu_netherlands_price_liter * 3.7854M;
        decimal eu_germany_price_gallon = eu_germany_price_liter * 3.7854M;

        /**
         *  Create or Get Rates from Cache
         **/
        String EXCHANGE_RATES_FILENAME = "exchange_rates.json";
        String result = "";
        if (!System.IO.File.Exists(Server.MapPath(EXCHANGE_RATES_FILENAME)) || Request["refresh"] != null)
        {
            /**
             * Go to the site and the Exchange Rates. Just a normal HTTP Request
             **/
            System.Net.WebRequest wbrq = System.Net.WebRequest.Create("http://openexchangerates.org/latest.json?app_id=3e08ad61518a4c538df31f1752072e48");
            wbrq.Method = "GET";
            System.Net.WebResponse wbrs = wbrq.GetResponse();
            System.IO.StreamReader sr = new System.IO.StreamReader(wbrs.GetResponseStream());
            result = sr.ReadToEnd().Trim();
            sr.Close(); // Close that puppy

            // Write to file to cache for next time
            System.IO.File.WriteAllText(Server.MapPath(EXCHANGE_RATES_FILENAME), result);
        }
        else
        {
            // Read from cached file
            result = System.IO.File.ReadAllText(Server.MapPath(EXCHANGE_RATES_FILENAME));
        }

        /**
         * Use Javascript to parse the JSON. Nice as we don't need a external library.
         **/
        Dictionary<String, Object> output = (Dictionary<String, Object>)srr.Deserialize(result, typeof(Dictionary<String, Object>));

        /** Get the Timestamped from the File **/
        double timestamped = 0; DateTime timestamp = DateTime.Now;
        if (double.TryParse(output["timestamp"].ToString(), out timestamped))
        {
            // Convert from Unix Time to Datetime in C#
            timestamp = new DateTime(1970, 1, 1, 0, 0, 0, 0).AddSeconds(timestamped);
        }

        // Get the Actual Rate Array
        Dictionary<String, Object> exchange_rates = (Dictionary<String, Object>)output["rates"];

        /**
         * Work out other rates based on USD as Bases
         **/
        decimal base_usd = Decimal.Parse(exchange_rates["USD"].ToString()); // The base. Should be 1... as it's the base ....

        /**
         * To work this out we use the excahgen rate that we want and multiple it by the inverse of the base. 
         * We can then just do simple devides and multiplication for work out the other currencies.
         **/
        decimal euro_exchange_rate = Decimal.Parse(exchange_rates["EUR"].ToString()) * (1 / base_usd);
        decimal zar_exchange_rate = Decimal.Parse(exchange_rates["ZAR"].ToString()) * (1 / base_usd);

        decimal dollar_rand = 1 / zar_exchange_rate;
        decimal dollar_euro = 1 / euro_exchange_rate;

        decimal euro_dollar = 1 / (1 / dollar_euro); // 1 dollar is {} euros'
        decimal euro_rand = euro_dollar * (1 / dollar_rand); // 1 rand is {} euros'

        decimal rand_dollar = 1 * zar_exchange_rate; // 1 dollar is {} rands -- DO
        decimal rand_euro = 1 * (1 / euro_rand); // 1 euro is {} rands
        dollar_euro = 1 * euro_exchange_rate; // And back we are. The first time was just to create a base for the euro_rand
    %>
    <div class="container">
        <fuelprice dollar_gallon="<%= Math.Round(sa_gauteng_cpt_price_gallon * dollar_rand, 2)%>"
            rand_gallon="<%= Math.Round(sa_gauteng_cpt_price_gallon, 2) %>" euro_gallon="<%= Math.Round(sa_gauteng_cpt_price_gallon * rand_euro, 2)%>"
            dollar_liter="<%= Math.Round(sa_gauteng_cpt_price_liter * dollar_rand, 2)%>"
            rand_liter="<%= Math.Round(sa_gauteng_cpt_price_liter, 2) %>" euro_liter="<%= Math.Round(sa_gauteng_cpt_price_liter * rand_euro, 2)%>"
            country="sa" region="gauteng" style="display: none;"></fuelprice>
        <fuelprice dollar_gallon="<%= Math.Round(sa_coastal_cpt_price_gallon * dollar_rand, 2)%>"
            rand_gallon="<%= Math.Round(sa_coastal_cpt_price_gallon, 2) %>" euro_gallon="<%= Math.Round(sa_coastal_cpt_price_gallon * rand_euro, 2)%>"
            dollar_liter="<%= Math.Round(sa_coastal_cpt_price_liter * dollar_rand, 2)%>"
            rand_liter="<%= Math.Round(sa_coastal_cpt_price_liter, 2) %>" euro_liter="<%= Math.Round(sa_coastal_cpt_price_liter * rand_euro, 2)%>"
            country="sa" region="coastal" style="display: none;"></fuelprice>
        <fuelprice dollar_gallon="<%= Math.Round(eu_france_price_gallon * euro_dollar, 2)%>"
            rand_gallon="<%= Math.Round(eu_france_price_gallon * euro_rand, 2)%>" euro_gallon="<%= Math.Round(eu_france_price_gallon, 2)%>"
            dollar_liter="<%= Math.Round(eu_france_price_liter * euro_dollar, 2)%>" rand_liter="<%= Math.Round(eu_france_price_liter * euro_rand, 2)%>"
            euro_liter="<%= Math.Round(eu_france_price_liter, 2)%>" country="eu" region="france"
            style="display: none;"></fuelprice>
        <fuelprice dollar_gallon="<%= Math.Round(eu_italy_price_gallon * euro_dollar, 2)%>"
            rand_gallon="<%= Math.Round(eu_italy_price_gallon * euro_rand, 2)%>" euro_gallon="<%= Math.Round(eu_italy_price_gallon, 2)%>"
            dollar_liter="<%= Math.Round(eu_italy_price_liter * euro_dollar, 2)%>" rand_liter="<%= Math.Round(eu_italy_price_liter * euro_rand, 2)%>"
            euro_liter="<%= Math.Round(eu_italy_price_liter, 2)%>" country="eu" region="italy"
            style="display: none;"></fuelprice>
        <fuelprice dollar_gallon="<%= Math.Round(eu_netherlands_price_gallon * euro_dollar, 2)%>"
            rand_gallon="<%= Math.Round(eu_netherlands_price_gallon * euro_rand, 2)%>" euro_gallon="<%= Math.Round(eu_netherlands_price_gallon, 2)%>"
            dollar_liter="<%= Math.Round(eu_netherlands_price_liter * euro_dollar, 2)%>"
            rand_liter="<%= Math.Round(eu_netherlands_price_liter * euro_rand, 2)%>" euro_liter="<%= Math.Round(eu_netherlands_price_liter, 2)%>"
            country="eu" region="netherlands" style="display: none;"></fuelprice>
        <fuelprice dollar_gallon="<%= Math.Round(eu_germany_price_gallon * euro_dollar, 2)%>"
            rand_gallon="<%= Math.Round(eu_germany_price_gallon * euro_rand, 2)%>" euro_gallon="<%= Math.Round(eu_germany_price_gallon, 2)%>"
            dollar_liter="<%= Math.Round(eu_germany_price_liter * euro_dollar, 2)%>" rand_liter="<%= Math.Round(eu_germany_price_liter * euro_rand, 2)%>"
            euro_liter="<%= Math.Round(eu_germany_price_liter, 2)%>" country="eu" region="germany"
            style="display: none;"></fuelprice>
        <fuelprice dollar_gallon="<%= Math.Round(us_cal_price_gallon, 2) %>" rand_gallon="<%= Math.Round(us_cal_price_gallon * zar_exchange_rate, 2) %>"
            euro_gallon="<%= Math.Round(us_cal_price_gallon * euro_exchange_rate, 2) %>"
            dollar_liter="<%= Math.Round(us_cal_price_liter, 2) %>" rand_liter="<%= Math.Round(us_cal_price_liter * zar_exchange_rate, 2) %>"
            euro_liter="<%= Math.Round(us_cal_price_liter * euro_exchange_rate, 2) %>" country="us"
            region="cal" style="display: none;"></fuelprice>
        <div class="rounded header">
            <div class="rounded subheader">
                <a href="http://www.amakozi.com">
                    <img src="/design/images/Logo 117x26 Grayscale Transparent.png" alt="Amakozi" border="0"
                        style="margin: 5px;" /></a>
                <div class="subheaderabout">
                    <div style="width: 100%; height: 10px;">
                    </div>
                    <center>
                        <a runat="server" href="~/awareness/default.aspx">Fuel</a>
                    </center>
                </div>
            </div>
        </div>
        <br />
        <div class="title">
            <center>
                Fuel Comparison
            </center>
        </div>
        <br />
        <table cellpadding="0" cellspacing="0" style="width: 100%; table-layout: fixed; margin-bottom: 5px;">
            <tr>
                <td>
                    <div class="compare1 rounded">
                        <div class="comparedetail rounded" style="height: 190px;">
                            <div class="comparedetailheader usflag">
                                <div style="width: 100%; height: 10px">
                                </div>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;United States
                            </div>
                            <div class="comparesummary">
                                <center class="comparesummarylarge" id="america_price_block">
                                </center>
                                <center class="comparesummarysmall domestic"></center>
                            </div>
                            <br />
                        </div>
                    </div>
                </td>
                <td style="width: 30px;" />
                <td>
                    <div class="compare2 rounded">
                        <div class="comparedetail rounded" style="height: 190px;">
                            <div class="comparedetailheader saflag">
                                <div style="width: 100%; height: 10px">
                                </div>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;South Africa
                            </div>
                            <div class="comparesummary">
                                <center class="comparesummarylarge" id="africa_price_block">
                                </center>
                                <center class="comparesummarysmall domestic"></center>
                                <center style="padding: 10px;">
                                    <select id="select_sa_regions" class="select_currency" style="font-size: 18px;">
                                        <option value="coastal">Coastal</option>
                                        <option value="gauteng">Gauteng</option>
                                    </select>
                                </center>
                            </div>
                            <br />
                        </div>
                    </div>
                </td>
                <td style="width: 30px;" />
                <td>
                    <div class="compare3 rounded">
                        <div class="comparedetail rounded" style="height: 190px;">
                            <div class="comparedetailheader euflag">
                                <div style="width: 100%; height: 10px">
                                </div>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Europe
                            </div>
                            <div class="comparesummary">
                                <center class="comparesummarylarge" id="europe_price_block">
                                </center>
                                <center class="comparesummarysmall domestic"></center>
                                <center style="padding: 10px;">
                                    <select id="select_eu_regions" style="font-size: 18px;">
                                        <option value="france">France</option>
                                        <option value="italy">Italy</option>
                                        <option value="netherlands">Netherlands</option>
                                        <option value="germany">Germany</option>
                                    </select>
                                </center>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
        <div style="clear: both; margin-top: 15px;">
        </div>
        <div id="information_and_control_container">
            <div>
                <div class="internal_control_container" style="float: right; width: 47.5%;">
                    <h4 style="font-weight: bold; margin: 0;">Exchange Rates</h4>
                    <table cellpadding="0" cellspacing="0" border="1" style="width: 100%;">
                        <thead>
                            <tr>
                                <th colspan="2" style="width: 140px;">Last Updated on
                                    <%= timestamp.ToString() %>
                                </th>
                                <th style="padding: 7px;">
                                    <img id="Img1" style="margin: 0; padding: 0;" runat="server" width="32" src="~/awareness/fuel/us.png" />
                                    <br />
                                    <h4 style="margin: 0; padding: 0;">USD</h4>
                                </th>
                                <th style="padding: 7px;">
                                    <img style="margin: 0; padding: 0;" id="Img2" runat="server" width="32" src="~/awareness/fuel/eu.png" />
                                    <br />
                                    <h4 style="margin: 0; padding: 0;">EUR</h4>
                                </th>
                                <th style="padding: 7px;">
                                    <img style="margin: 0; padding: 0;" id="Img3" runat="server" width="32" src="~/awareness/fuel/sa.png" />
                                    <br />
                                    <h4 style="margin: 0; padding: 0;">ZAR</h4>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td rowspan="2" style="text-align: center;">
                                    <img id="Img4" style="margin: 0; padding: 0;" runat="server" width="32" src="~/awareness/fuel/us.png" />
                                </td>
                                <td style="text-align: center;">1 USD </td>
                                <td style="text-align: center;"><strong style="color: darkgray;">1.0000</strong>
                                </td>
                                <td style="text-align: center;">
                                    <%= Math.Round(dollar_euro, 4)%>
                                </td>
                                <td style="text-align: center;">
                                    <%= Math.Round(rand_dollar, 4) %>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: center;"><strong style="color: darkgray;">Inverse</strong>
                                </td>
                                <td style="text-align: center;"><strong style="color: darkgray;">1.0000</strong>
                                </td>
                                <td style="text-align: center;">
                                    <%= Math.Round(euro_dollar, 4) %>
                                </td>
                                <td style="text-align: center;">
                                    <%= Math.Round(dollar_rand, 4) %>
                                </td>
                            </tr>
                            <tr>
                                <td rowspan="2" style="text-align: center;">
                                    <img id="Img5" style="margin: 0; padding: 0;" runat="server" width="32" src="~/awareness/fuel/eu.png" />
                                </td>
                                <td style="text-align: center;">1 EUR </td>
                                <td style="text-align: center;">
                                    <%= Math.Round(euro_dollar, 4) %>
                                </td>
                                <td style="text-align: center;"><strong style="color: darkgray;">1.0000</strong>
                                </td>
                                <td style="text-align: center;">
                                    <%= Math.Round(euro_rand, 4) %>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: center;"><strong style="color: darkgray;">Inverse</strong>
                                </td>
                                <td style="text-align: center;">
                                    <%= Math.Round(dollar_euro, 4)%>
                                </td>
                                <td style="text-align: center;"><strong style="color: darkgray;">1.0000</strong>
                                </td>
                                <td style="text-align: center;">
                                    <%= Math.Round(rand_euro, 4) %>
                                </td>
                            </tr>
                            <tr>
                                <td rowspan="2" style="text-align: center;">
                                    <img id="Img6" style="margin: 0; padding: 0;" runat="server" width="32" src="~/awareness/fuel/sa.png" />
                                </td>
                                <td style="text-align: center;">1 ZAR </td>
                                <td style="text-align: center;">
                                    <%= Math.Round(dollar_rand, 4) %>
                                </td>
                                <td style="text-align: center;">
                                    <%= Math.Round(rand_euro, 4) %>
                                </td>
                                <td style="text-align: center;"><strong style="color: darkgray;">1.0000</strong>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: center;"><strong style="color: darkgray;">Inverse</strong>
                                </td>
                                <td style="text-align: center;">
                                    <%= Math.Round(rand_dollar, 4) %>
                                </td>
                                <td style="text-align: center;">
                                    <%= Math.Round(euro_rand, 4) %>
                                </td>
                                <td style="text-align: center;"><strong style="color: darkgray;">1.0000</strong>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="internal_control_container" style="width: 46.8%;">
                    <table style="width: 100%;">
                        <tr>
                            <td style="padding-right: 5px;"><strong>Show Comparison as</strong></td>
                            <td style="width: 220px;">
                                <select id="select_currency_dropdown" style="width: 80px;">
                                    <option <%= country_code == "sa" ? "selected" : "" %> value="rand">Rand</option>
                                    <option <%= country_code == "us" ? "selected" : "" %> value="dollar">Dollar</option>
                                    <option <%= country_code != "sa" && country_code != "us" ? "selected" : "" %> value="euro">Euro</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right; padding-right: 20px;"><strong>per</strong></td>
                            <td style="width: 120px;">
                                <select id="select_metric_dropdown" style="width: 80px;">
                                    <option value="liter">Liter</option>
                                    <option value="gallon">US Gallon</option>
                                </select>
                            </td>
                        </tr>
                    </table>
                    <div>
                        <h4 style="margin-bottom: 5px;">What is This</h4>
                        <p style="margin: 5px; font-size: 13px;">
                            Are we paying market related prices for our petrol? This page gives an indication
                            of the difference between petrol prices in the USA, Europe and South Africa.<br />
                            <br />
                            The comparison is not straightforward – many factors come into play, the most important
                            of which are shipping and related costs, and government taxes. For instance, the
                            USA produces most of its own oil, and has relatively low taxes on fuel. On the other
                            extreme, Europe gets most of its oil from the North Sea, so it has very low transport
                            costs, but there are very high taxes on the fuel, thereby making the pump price
                            much higher than in South Africa.<br />
                            <br />
                            The fuel prices in this page only reflect pump prices, which already include all
                            costs and taxes.
                        </p>
                        <h5>Why is Brent crude used to determine the fuel price?</h5>
                        <p style="font-size: 13px;">
                            Brent crude is a light crude oil from the North Sea. South Africa nearly never imports
                            Brent crude, but instead imports most of its oil from the Middle East, and also
                            sources a substantial portion of refined fuels locally from Sasol, so why is Brent
                            crude prices used to calculate our fuel price?
                        </p>
                        <p style="font-size: 13px;">
                            Brent crude is one of the world’s most important reliable benchmark crudes, and
                            the price responds quickly to price signals from the market. It is also one of the
                            crude oil prices that is always available. Two thirds of the world's traded crude
                            oil supplies are priced relative to it, so the price of the crude oil that South
                            Africa imports always moves up and down relative to Brent crude. The price of Brent
                            crude is also close enough to the basket of crudes that South Africa imports, that
                            it makes no substantial difference to the fuel price calculation.
                        </p>
                    </div>
                </div>
                <div style="clear: both;">
                </div>
            </div>
        </div>
        <h4 style="margin-bottom: 5px;">Disclaimer</h4>
        <p style="margin: 5px; font-size: 13px;">
            These comparisons are intended to provide illustrative examples only, and are based
            on external data feeds beyond the control of Amakozi Technologies. Calculations
            and data, including but not limited to local and international fuel prices and exchange
            rates, are meant as estimates only and are not intended to be kept or used for any
            practical purpose. They are based on information from sources believed to be reliable
            and accurate and are not intended to be used as a substitute for professional advice.
            The comparisons and data are not intended to be relied on for the purposes of making
            a decision in relation to a particular product, financial decision or strategy.
            Actual fuel prices and exchange rates will depend on a range of factors outside
            the control of Amakozi Technologies. Amakozi Technologies expressly disclaims all
            liability and responsibility to any person who relies, or partially relies, upon
            anything done or omitted to be done by this service.
        </p>
        <p style="text-align: center; color: Red; font-weight: bold;">
            Exchange Rates last updated on
            <%= timestamp.ToString("dd MMMM yyyy H:mm:ss tt") %>
            / Fuel Prices last updated on
            <%= fuel_price_timestamp.ToString("dd MMMM yyyy")%>
        </p>
        <div class="clear" />
        <div class="footer">
            © 2012 Amakozi Technlogies. All Rights Reserved.<div style="float: right">
                <a runat="server" href="~/company/privacy.aspx" target="_blank">Privacy</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
                    runat="server" href="~/company/contact.aspx" target="_blank">Contact</a>
            </div>
        </div>
    </div>
    <script type="text/javascript">

        /**
        * Apply the Currency Filtering
        * @author Johann du Toit
        */
        function filter() {

            // Do America
            write_price_hear($("#america_price_block"), 'us', 'cal', 'dollar');

            // Do Africa
            write_price_hear($("#africa_price_block"), 'sa', $("#select_sa_regions").val(), 'rand');

            // Do Europe
            write_price_hear($("#europe_price_block"), 'eu', $("#select_eu_regions").val(), 'euro');
        }

        /**
        * Handles the filtering and applying of the actual tag
        * @author Johann du Toit
        */
        function write_price_hear(selector, country, region, country_currency) {
            var currency = $("#select_currency_dropdown").val();

            if (currency == "euro") var symbol = '€';
            else if (currency == "dollar") var symbol = '$';
            else var symbol = 'R';

            if (country_currency == "euro") var country_symbol = '€';
            else if (country_currency == "dollar") var country_symbol = '$';
            else var country_symbol = 'R';

            var metric = $("#select_metric_dropdown").val();
            var dropdown_text = $("#select_metric_dropdown option[value='" + metric + "']").text();

            $('fuelprice').each(function () {
                var fuel_span = this;
                if ($(fuel_span).attr('country') == country && $(fuel_span).attr('region') == region) {

                    var price = $(fuel_span).attr(currency + "_" + metric);
                    var domestic_liter = $(fuel_span).attr(country_currency + "_liter");
                    var domestic_gallon = $(fuel_span).attr(country_currency + "_gallon");

                    $(selector).html(symbol + ' ' + price + "<span style=\"font-size:15px;\"> / <strong>" + dropdown_text + "</strong></span>");
                    $(selector).next('.domestic').html('<span style="font-size:18px;">Domestic: ' + country_symbol + ' ' + domestic_liter + ' per <strong>liter</strong></span><br /><span style="font-size:12px;">' + country_symbol + ' ' + domestic_gallon + ' per <strong>US gallon</strong></span>');

                }

            });
        }

        /**
        * Load Document for ready to use. The start-up script for the page.
        * @author Johann du Toit
        */
        $(document).ready(function () {
            filter();

            $("#select_currency_dropdown, #select_metric_dropdown, .select_currency, #select_eu_regions, #select_sa_regions").change(function () { filter(); });

        });
    </script>
    <script type="text/javascript">
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-19316050-1']);
        _gaq.push(['_trackPageview']);
        (function () {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();
    </script>
    <asp:ScriptManager runat="server">
        <Scripts>
            <asp:ScriptReference Path="~/awareness/fuel/jquery-1.7.1.min.js" />
        </Scripts>
    </asp:ScriptManager>
    </form>
</body>
</html>
