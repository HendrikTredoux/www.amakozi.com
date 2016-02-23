﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContentAwaitingApproval.aspx.cs" 
    MasterPageFile="~/App_MasterPages/layout.Master" Inherits="mojoPortal.Web.AdminUI.ContentAwaitingApprovalPage" %>
    
<asp:Content ContentPlaceHolderID="leftContent" ID="MPLeftPane" runat="server" />
<asp:Content ContentPlaceHolderID="mainContent" ID="MPContent" runat="server">
<div class="breadcrumbs">
        <asp:HyperLink ID="lnkAdminMenu" runat="server" NavigateUrl="~/Admin/AdminMenu.aspx" />&nbsp;&gt;
        <asp:HyperLink ID="lnkContentWorkFlow" runat="server"  NavigateUrl="~/Admin/ContentWorkflow.aspx" />&nbsp;&gt;
        <asp:HyperLink ID="lnkCurrentPage" runat="server" CssClass="selectedcrumb" />
    </div>
<portal:OuterWrapperPanel ID="pnlOuterWrap" runat="server">
<mp:CornerRounderTop id="ctop1" runat="server" />    
<portal:InnerWrapperPanel ID="pnlInnerWrap" runat="server" CssClass="panelwrapper admin workflow">
<portal:HeadingControl id="heading" runat="server" />
<portal:OuterBodyPanel ID="pnlOuterBody" runat="server">
<portal:InnerBodyPanel ID="pnlInnerBody" runat="server" CssClass="modulecontent">
   <asp:literal id="ltlIntroduction" runat="server"></asp:literal>
   <mp:mojoGridView ID="grdContentAwaitingApproval" runat="server" AllowPaging="false" AllowSorting="false"
        AutoGenerateColumns="false"  DataKeyNames="Guid">
        <Columns>            
            <asp:TemplateField>
                <ItemTemplate>
                    <%# Eval("ModuleTitle")%>
                </ItemTemplate>                                
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <%# Eval("RecentActionByUserName")%>
                </ItemTemplate>                                
            </asp:TemplateField>
            <asp:TemplateField>
	            <ItemTemplate>
	                <%# DateTimeHelper.Format(Convert.ToDateTime(Eval("RecentActionOn")), timeZone, "g", timeOffset) %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Repeater ID="rptPageLinks" runat="server">
                        <ItemTemplate>
                            <a href='<%# SiteRoot + Eval("PageUrl").ToString().Replace("~/","/") + "?vm=WorkInProgess"%>'><%# Eval("PageName")%></a>
                        </ItemTemplate>
                    </asp:Repeater>
                </ItemTemplate>
            </asp:TemplateField>            
        </Columns>
        <EmptyDataTemplate>
            <p class="nodata"><asp:Literal id="litempty" runat="server" Text="<%$ Resources:Resource, GridViewNoData %>" /></p>
    </EmptyDataTemplate>
    </mp:mojoGridView>
    <div class="modulepager">
        <portal:mojoCutePager ID="pgrContentAwaitingApproval" runat="server" />
    </div>
    </portal:InnerBodyPanel>
    </portal:OuterBodyPanel>
    <portal:EmptyPanel id="divCleared" runat="server" CssClass="cleared" SkinID="cleared"></portal:EmptyPanel>
    </portal:InnerWrapperPanel>
<mp:CornerRounderBottom id="cbottom1" runat="server" />
</portal:OuterWrapperPanel>
<portal:SessionKeepAliveControl id="ka1" runat="server" />

</asp:Content>
<asp:Content ContentPlaceHolderID="rightContent" ID="MPRightPane" runat="server" />
<asp:Content ContentPlaceHolderID="pageEditContent" ID="MPPageEdit" runat="server" />

