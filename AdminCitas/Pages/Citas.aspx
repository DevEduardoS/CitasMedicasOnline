<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Citas.aspx.cs" Inherits="AdminCitas.Pages.Citas" %>

<asp:Content runat="server" ContentPlaceHolderID="title" ID="Titulo">Citas</asp:Content>

<asp:Content ID="ContentCitas" ContentPlaceHolderID="MainContent" runat="server">
    <div class="d-flex justify-content-center">
        <h4>Listado de citas</h4>
    </div>
    <div class="d-flex justify-content-end">
        <asp:Button runat="server" CssClass="btn form-control-sm btn-outline-success" ID="btnAdd" Text="Nueva cita" OnClick="btnAdd_Click" />
    </div>
    <div class="row mt-5">
        <asp:GridView runat="server" ID="GvCitas">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button runat="server" CssClass="btn form-control-sm btn-outline-info" Text="Editar" ID="btnUpdate" OnClick="btnUpdate_Click" />
                        <asp:Button runat="server" CssClass="btn form-control-sm btn-outline-danger" Text="Eliminar" ID="btnDelete" OnClick="btnDelete_Click" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
