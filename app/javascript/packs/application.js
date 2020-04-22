require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";

import { replaceLabelWithDiv, replaceFieldsetWithDiv } from './plugins/customRadioButtons'

replaceLabelWithDiv()
replaceFieldsetWithDiv()
