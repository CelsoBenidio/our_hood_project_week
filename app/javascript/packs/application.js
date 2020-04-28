require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")

import "bootstrap";
import { replaceLabelWithDiv, replaceFieldsetWithDiv, handleCheckboxState } from './plugins/customRadioButtons'
import {initStripe} from './plugins/subscriptions'
import {initSurvey} from './plugins/survey'
import {initCart} from './plugins/cart'
import { initUpdateNavbarOnScroll } from '../components/navbar';

initStripe()
replaceLabelWithDiv()
replaceFieldsetWithDiv()
handleCheckboxState()
initSurvey()
initCart()
initUpdateNavbarOnScroll();



