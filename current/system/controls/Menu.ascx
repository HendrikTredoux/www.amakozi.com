<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Menu.ascx.cs" Inherits="system_controls_Menu" %>
<div id="menu">
    <ul class="glossymenu">
        <asp:Repeater ID="MenuItems" runat="server">
            <ItemTemplate>

                <li  <%# ((SiteSection)Eval("key") == SiteSection.awareness || (SiteSection)Eval("key") == SiteSection.talk) ? "style=\"float:right;\"" : "" %> class="<%# ((SiteSection)Eval("key") == Location ? "current" : "") %>"><a class="in_menu" runat="server" href='<%# "~" + Eval("value.value") %>'><b>
                        <%# Eval("value.key")%></b></a><%# sub_menus((SiteSection)Eval("key")) %>
                </li>
            </ItemTemplate>
        </asp:Repeater>
    </ul>
</div>
