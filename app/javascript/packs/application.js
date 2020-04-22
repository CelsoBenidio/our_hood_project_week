require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")

import { replaceLabelWithDiv, replaceFieldsetWithDiv, handleCheckboxState } from './plugins/customRadioButtons'
import { initMobileMenu } from './plugins/navbartoggle'

replaceLabelWithDiv()
replaceFieldsetWithDiv()
handleCheckboxState()
initMobileMenu()

import "bootstrap";

