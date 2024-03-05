window.$ = window.jQuery = require("jquery");
require("jquery-mask-plugin");

import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="municipes"
export default class extends Controller {
  connect() {
    this.maskFields();
    this.addListerner();
  }

  maskFields() {
    $("#municipe_cns").mask("000 0000 0000 0000");
    $("#municipe_phone").mask("(00) 00000-0009");
    $("#municipe_cpf").mask("000.000.000-00");
    $("#municipe_address_attributes_zip_code").mask("00 000-000");
  }

  addListerner() {
    $("#municipe_address_attributes_zip_code").on("blur", function () {});
  }
}
