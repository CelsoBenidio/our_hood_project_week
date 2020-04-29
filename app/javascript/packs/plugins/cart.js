const boxes = document.querySelectorAll('.box-card')
const form = document.querySelector('.edit_cart')
const initCart = () => {
  if (boxes.length) {
    form.querySelector('input[type="submit"]').disabled = true
    boxes.forEach((box) => {
      box.classList.remove('selected')
      box.addEventListener('click', (event) => {
        event.preventDefault()
        const currentActive = document.querySelector('.box-card.selected')
        if (currentActive) {
          currentActive.classList.remove('selected')
        }
        const input = box.querySelector('input')
        input.checked = !input.checked
        if (input.checked) {
        box.classList.add('selected')
        form.querySelector('input[type="submit"]').disabled = false
        showSubTotal(parseInt(box.dataset.price))
        } else {
          form.querySelector('input[type="submit"]').disabled = true
          box.classList.remove('selected')
          showSubTotal()
        }
        })
    })
  }
}
const showSubTotal = (price = null) => {
  const subtotal = document.querySelector('#subtotal')
  const amountWithCurrency = document.querySelector('div[data-subtotal]').dataset.subtotal
  const currency = amountWithCurrency[amountWithCurrency.length - 1]
  const amount = parseInt(amountWithCurrency.slice(0,-1).trim())
  if (subtotal) {
    subtotal.innerText = price ? `${price + amount} ${currency}` : amountWithCurrency
  }
}
export {initCart, showSubTotal}

