const boxes = document.querySelectorAll('.box-card')
const form = document.querySelector('.edit_cart')

let firstLoad = true
const amountWithCurrency = document.querySelector('div[data-subtotal]').dataset.subtotal
const currency = amountWithCurrency[amountWithCurrency.length - 1]
let amount = parseInt(amountWithCurrency.slice(0,-1).trim())

const initCart = () => {
  if (boxes.length) {
    boxes.forEach((box) => {
      box.classList.remove('selected')
      box.addEventListener('click', (event) => {
        event.preventDefault()
        const currentActive = document.querySelector('.box-card.selected')
        if (currentActive) {
          currentActive.classList.remove('selected')
          showSubTotal(-Math.abs(parseInt(currentActive.dataset.price)))
        }
        const input = box.querySelector('input')
        input.checked = !input.checked
        if (input.checked) {
        box.classList.add('selected')
        form.querySelector('input[type="submit"]').disabled = false
        if (firstLoad) {
          firstLoad = false
        } else {
          showSubTotal(parseInt(box.dataset.price))
        }
        } else {
          form.querySelector('input[type="submit"]').disabled = true
          box.classList.remove('selected')
          showSubTotal(-Math.abs(parseInt(box.dataset.price)))
        }
        })
    })
    const selectedBox = document.querySelector("div[data-selected-box]").dataset.selectedBox
    if (selectedBox) {
      const selectedDiv = document.querySelector(`div[data-box-id="${selectedBox}"]`)
      selectedDiv.click()
      console.log(selectedDiv)
    } else {
      form.querySelector('input[type="submit"]').disabled = true
    }
  }
}
const showSubTotal = (price = 0) => {
  const subtotal = document.querySelector('#subtotal')
  if (subtotal) {
    amount = amount + price
    if (amount < 0) {
      amount = 0
    }
    subtotal.innerText = `${amount} ${currency}`
  }
}
export {initCart, showSubTotal}

