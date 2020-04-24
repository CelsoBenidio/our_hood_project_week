require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")

import { replaceLabelWithDiv, replaceFieldsetWithDiv, handleCheckboxState } from './plugins/customRadioButtons'


replaceLabelWithDiv()
replaceFieldsetWithDiv()
handleCheckboxState()

import "bootstrap";

