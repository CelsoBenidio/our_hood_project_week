require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")

import "bootstrap";

import { replaceLabelWithDiv, replaceFieldsetWithDiv } from './plugins/customRadioButtons'

replaceLabelWithDiv()
replaceFieldsetWithDiv()
