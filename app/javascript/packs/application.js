// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//images
require.context('../images', true)

import Rails from "@rails/ujs";

import * as ActiveStorage from "@rails/activestorage";
import "channels";
//import yarn libs
import "jquery";
require("@nathanvda/cocoon")
import "bootstrap";
import "../stylesheets/application.scss";
import 'bootstrap-icons/font/bootstrap-icons.css';



Rails.start()
ActiveStorage.start()
