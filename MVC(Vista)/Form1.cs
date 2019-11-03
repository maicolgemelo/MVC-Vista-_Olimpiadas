using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using CONTROLADOR.Paises;

namespace MVC_Vista_
{
    public partial class Form1 : Form
    {

        PaisesDTO paisesDTO = null;
        PaisesDAO paisesDAO = null;
        DataTable Dtt = null;


        public Form1()
        {
            InitializeComponent();
            ListarPaises();
            lblCodigo.Visible = false;
            txtCodigo.Visible = false;
            btnGuardarCambios.Enabled = false;
            btneliminar.Enabled = false;
            btnCancelar.Enabled = false;
            txtPais.MaxLength = 50;
        }

        public void ListarPaises()
        {
            paisesDTO = new PaisesDTO();
            paisesDAO = new PaisesDAO(paisesDTO);

            Dtt = new DataTable();
            Dtt = paisesDAO.ListarPaises();

            if (Dtt.Rows.Count > 0) {

                dtPaises.DataSource = Dtt;

            } else
            {

                MessageBox.Show("No hay registro de paises");

            }



        }

        public void Guardar() {

            paisesDTO = new PaisesDTO();
            paisesDTO.setNombrepais(txtPais.Text);
            paisesDAO = new PaisesDAO(paisesDTO);

            paisesDAO.GuardarPais();
            MessageBox.Show("Registro guardado");



        }

        public void GuardaCambios()
        {

            paisesDTO = new PaisesDTO();
            paisesDTO.setIdpais(Convert.ToInt16(txtCodigo.Text));
            paisesDTO.setNombrepais(txtPais.Text);
            paisesDAO = new PaisesDAO(paisesDTO);

            paisesDAO.GuardarCambiosPais();
            MessageBox.Show("Registro Modificado");



        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            if (txtPais.Text.Trim()=="") {
                MessageBox.Show("oye hacker, intenta un dato valido");
                txtPais.Focus();

            } else {
                Guardar();
                ListarPaises();
                txtPais.Clear();
                txtPais.Focus();

            }


            
        }

        private void dtPaises_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            lblCodigo.Visible = true;
            txtCodigo.Visible = true;
            txtCodigo.Enabled = false;

            txtCodigo.Text = dtPaises.Rows[dtPaises.CurrentRow.Index].Cells[0].Value.ToString();
            txtPais.Text = dtPaises.Rows[dtPaises.CurrentRow.Index].Cells[1].Value.ToString();

            btnGuardar.Enabled = false;
            btnGuardarCambios.Enabled = true;
            btneliminar.Enabled = true;
            btnCancelar.Enabled = true;
        }

        private void btnGuardarCambios_Click(object sender, EventArgs e)
        {
            if (txtPais.Text.Trim() == "")
            {
                MessageBox.Show("oye hacker, intenta un dato valido");
                txtPais.Focus();

            }
            else
            {
                GuardaCambios();
                ListarPaises();
                btnGuardar.Enabled = true;
                txtCodigo.Visible = false;
                lblCodigo.Visible = false;
                btnGuardarCambios.Enabled = false;
                btneliminar.Enabled = false;
                btnCancelar.Enabled = false;
                txtPais.Clear();
                txtPais.Focus();
            }

              
           
        }

        public void EliminarRegistroPais() {


            paisesDTO = new PaisesDTO();
            paisesDTO.setIdpais(Convert.ToInt16(txtCodigo.Text));
            paisesDAO = new PaisesDAO(paisesDTO);

            paisesDAO.EliminarPais();
            MessageBox.Show("Registro Eliminado");



        }

        private void btneliminar_Click(object sender, EventArgs e)
        {
            EliminarRegistroPais();
            ListarPaises();
            btnGuardar.Enabled = true;
            txtCodigo.Visible = false;
            lblCodigo.Visible = false;
            btnGuardarCambios.Enabled = false;
            btneliminar.Enabled = false;
            btnCancelar.Enabled = false;
            txtPais.Clear();
            txtPais.Focus();

        }
    }
}
