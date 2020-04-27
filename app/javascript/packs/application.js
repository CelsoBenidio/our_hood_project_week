require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")

import "bootstrap";
import { replaceLabelWithDiv, replaceFieldsetWithDiv, handleCheckboxState } from './plugins/customRadioButtons'
import {initSurvey} from './plugins/survey'

replaceLabelWithDiv()
replaceFieldsetWithDiv()
handleCheckboxState()
initSurvey()





