require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")

import { replaceLabelWithDiv, replaceFieldsetWithDiv } from './plugins/customRadioButtons'
import { initMobileMenu } from './plugins/navbartoggle'

replaceLabelWithDiv()
replaceFieldsetWithDiv()
initMobileMenu()
import "bootstrap";
