require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")

import "bootstrap";
import { replaceLabelWithDiv, replaceFieldsetWithDiv, handleCheckboxState } from './plugins/customRadioButtons'
import {initStripe} from './plugins/subscriptions'

initStripe()
replaceLabelWithDiv()
replaceFieldsetWithDiv()
handleCheckboxState()


