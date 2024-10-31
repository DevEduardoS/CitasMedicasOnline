<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FormCita.aspx.cs" Inherits="AdminCitas.Pages.FormCita" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <h5 class="text-center">Información del paciente</h5>
        </div>
        <div class="row gy-3 mt-3">
            <div class="col-12 col-md-6 col-lg-3">
                <label class="form-label">Nombre<span class="text-danger ps-1">*</span></label>
                <asp:TextBox runat="server" ID="txtNombrePaciente" CssClass="form-control" placeholder="Nombre"></asp:TextBox>
                <asp:RequiredFieldValidator CssClass="text-danger" runat="server" ControlToValidate="txtNombrePaciente" ErrorMessage="Nombre requerido"></asp:RequiredFieldValidator>
            </div>
            <div class="col-12 col-md-6 col-lg-3">
                <label class="form-label">Apellido paterno<span class="text-danger ps-1">*</span></label>
                <asp:TextBox runat="server" ID="txtApellidoPaterno" CssClass="form-control" placeholder="Apellido paterno"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" CssClass="text-danger" ControlToValidate="txtApellidoPaterno" ErrorMessage="Apellido paterno requerido"></asp:RequiredFieldValidator>
            </div>
            <div class="col-12 col-md-6 col-lg-3">
                <label class="form-label">Ápellido materno</label>
                <asp:TextBox runat="server" ID="txtApellidoMaterno" CssClass="form-control" placeholder="Apellido materno"></asp:TextBox>
            </div>
            <div class="col-12 col-md-6 col-lg-3">
                <label class="form-label">Fecha nacimiento<span class="text-danger ps-1">*</span></label>
                <asp:TextBox runat="server" ID="txtFechaNacimiento" CssClass="form-control" TextMode="Date"></asp:TextBox>
            </div>
            <div class="col-12 col-md-6 col-lg-3">
                <label class="form-label">Correo</label>
                <asp:TextBox runat="server" ID="txtCorreo" CssClass="form-control" placeholder="correo@correo.com"></asp:TextBox>
            </div>
            <div class="col-12 col-md-6 col-lg-3">
                <label class="form-label">Teléfono</label>
                <asp:TextBox runat="server" ID="txtTelefono" CssClass="form-control" placeholder="1234567890"></asp:TextBox>
            </div>
        </div>
    </div>
    <div class="container mt-3">
        <div class="row">
            <h5 class="text-center">Información la cita</h5>
        </div>
        <div class="row gy-3 mt-3">
            <div class="col-12 col-md-6 col-lg-3">
                <label class="form-label">Especialidad<span class="text-danger ps-1">*</span></label>
                <asp:DropDownList runat="server" ID="ddlEspecialidad" CssClass="form-select" AutoPostBack="true" OnSelectedIndexChanged="ddlEspecialidad_SelectedIndexChanged">
                    <asp:ListItem Value="0" Text="SELECCIONA UNA ESPECIALIDAD" Selected="True" disabled></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-12 col-md-6 col-lg-3">
                <label class="form-label">Médico<span class="text-danger ps-1">*</span></label>
                <asp:DropDownList runat="server" ID="ddlMedicos" CssClass="form-select" Enabled="false">
                    <asp:ListItem Value="0" Text="SELECCIONA UN MÉDICO" Selected="True" disabled></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-12 col-md-6 col-lg-3">
                <label class="form-label">Fecha y hora de cita<span class="text-danger ps-1">*</span></label>
                <asp:TextBox runat="server" ID="txtFechaCita" CssClass="form-control" TextMode="DateTimeLocal"></asp:TextBox>
            </div>
            <div class="col-12 col-md-6 col-lg-3">
                <label class="form-label">Motivo</label>
                <asp:TextBox runat="server" ID="txtMotivo" CssClass="form-control" placeholder="Tos, Gripa, etc."></asp:TextBox>
            </div>
        </div>
    </div>
    <div class="mt-3">
        <asp:Button runat="server" ID="btnSave" CssClass="btn btn-outline-success" CausesValidation="true" Text="Guardar" />
        <asp:Button runat="server" ID="btnCancel" CssClass="btn btn-outline-danger" CausesValidation="false" Text="Cancelar" OnClick="btnCancel_Click" />
    </div>
</asp:Content>
