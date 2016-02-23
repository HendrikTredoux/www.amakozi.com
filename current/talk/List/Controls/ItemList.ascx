<%@ Control Language="C#" AutoEventWireup="false" CodeBehind="ItemList.ascx.cs" Inherits="mojoPortal.Web.LinksUI.ItemList" %>
<div class="listintro"><asp:Literal id="litIntro" runat="server" /></div>
<asp:UpdatePanel ID="updPnl" UpdateMode="Conditional" runat="server">
            <ContentTemplate>
                    <asp:Repeater ID="rptLinks" runat="server">
                        <HeaderTemplate>
                            <ul class="linkitem">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li class="linkitem">
                                <%# CreateLink(DataBinder.Eval(Container.DataItem, "Title").ToString(), DataBinder.Eval(Container.DataItem, "Url").ToString(), DataBinder.Eval(Container.DataItem, "Description").ToString(), DataBinder.Eval(Container.DataItem, "Target").ToString())%>
                                <asp:HyperLink ID="editLink2" runat="server" EnableViewState="false" Text="<%# Resources.LinkResources.LinksEditLink %>"
                                    ToolTip="<%# Resources.LinkResources.LinksEditLink %>" NavigateUrl='<%# this.SiteRoot + "/List/Edit.aspx?ItemID=" + DataBinder.Eval(Container.DataItem,"ItemID") + "&amp;mid=" + ModuleId + "&amp;pageid=" + PageId %>'
                                    Visible="<%# IsEditable%>" ImageUrl="<%# LinkImage %>"></asp:HyperLink>
                                <asp:Literal ID="lblDescription2" runat="server" Visible="<%# Config.UseDescription %>" Text='<%#  "&nbsp;" +DataBinder.Eval(Container.DataItem,"Description").ToString()%>'
                                    EnableViewState="false" /></li>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <li class="linkaltitem">
                                <%# CreateLink(DataBinder.Eval(Container.DataItem, "Title").ToString(), DataBinder.Eval(Container.DataItem, "Url").ToString(), DataBinder.Eval(Container.DataItem, "Description").ToString(), DataBinder.Eval(Container.DataItem, "Target").ToString())%>
                                <asp:HyperLink ID="editLink2" runat="server" EnableViewState="false" Text="<%# Resources.LinkResources.LinksEditLink %>"
                                    ToolTip="<%# Resources.LinkResources.LinksEditLink %>" NavigateUrl='<%# this.SiteRoot + "/List/Edit.aspx?ItemID=" + DataBinder.Eval(Container.DataItem,"ItemID") + "&amp;mid=" + ModuleId + "&amp;pageid=" + PageId %>'
                                    Visible="<%# IsEditable%>" ImageUrl="<%# LinkImage %>"></asp:HyperLink>      
                                <asp:Literal ID="lblDescription2" runat="server" Visible="<%# Config.UseDescription %>" Text='<%#  "&nbsp;" +DataBinder.Eval(Container.DataItem,"Description").ToString()%>'
                                    EnableViewState="false" /></li>
                        </AlternatingItemTemplate>
                        <FooterTemplate>
                            </ul></FooterTemplate>
                    </asp:Repeater>
                    <asp:Repeater ID="rptDescription" runat="server" Visible="false">
                        <ItemTemplate>
                            <div class="linkdesc">
                                <asp:HyperLink ID="editLink2" runat="server" EnableViewState="false" Text="<%# Resources.LinkResources.LinksEditLink %>"
                                    ToolTip="<%# Resources.LinkResources.LinksEditLink %>" NavigateUrl='<%# this.SiteRoot + "/List/Edit.aspx?ItemID=" + DataBinder.Eval(Container.DataItem,"ItemID") + "&amp;mid=" + ModuleId + "&amp;pageid=" + PageId %>'
                                    Visible="<%# IsEditable%>" ImageUrl="<%# LinkImage %>"></asp:HyperLink>
                                <asp:Literal ID="lblDescription2" runat="server" Visible="<%# Config.UseDescription %>" Text='<%# DataBinder.Eval(Container.DataItem,"Description").ToString()%>'
                                    EnableViewState="false" />
                            </div>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <div class="linkdesc linkdescalt">
                                <asp:HyperLink ID="editLink2" runat="server" EnableViewState="false" Text="<%# Resources.LinkResources.LinksEditLink %>"
                                    ToolTip="<%# Resources.LinkResources.LinksEditLink %>" NavigateUrl='<%# this.SiteRoot + "/List/Edit.aspx?ItemID=" + DataBinder.Eval(Container.DataItem,"ItemID") + "&amp;mid=" + ModuleId + "&amp;pageid=" + PageId %>'
                                    Visible="<%# IsEditable%>" ImageUrl="<%# LinkImage %>"></asp:HyperLink>
                                <asp:Literal ID="lblDescription2" runat="server" Visible="<%# Config.UseDescription%>" Text='<%# DataBinder.Eval(Container.DataItem,"Description").ToString()%>'
                                    EnableViewState="false" />
                            </div>
                        </AlternatingItemTemplate>
                    </asp:Repeater>
                    <div class="modulepager">
                    <portal:mojoCutePager ID="pgr" runat="server" Visible="false" />
                    </div>
                <portal:EmptyPanel id="divFooter" runat="server" CssClass="modulefooter" SkinID="modulefooter"></portal:EmptyPanel>
            </ContentTemplate>
        </asp:UpdatePanel>
