const boxes = document.querySelectorAll('.box-card')
const form = document.querySelector('.edit_cart')

let firstLoad = true
const productsPrice = parseInt(document.querySelector('div[data-products-price]').dataset.productsPrice)
const currency = '₺'
let boxPrice = parseInt(document.querySelector('div[data-box-price]').dataset.boxPrice)

const initCart = () => {
  if (boxes.length) {
    boxes.forEach((box) => {
      box.classList.remove('selected')
      box.addEventListener('click', (event) => {
        event.preventDefault()
        const currentActive = document.querySelector('.box-card.selected')
        if (currentActive) {
          currentActive.classList.remove('selected')
          boxPrice = boxPrice - parseInt(currentActive.dataset.price)
          // showSubTotal(-Math.abs(parseInt(currentActive.dataset.price)))
        }
        const input = box.querySelector('input')
        input.checked = !input.checked
        if (input.checked) {
        box.classList.add('selected')
        form.querySelector('input[type="submit"]').disabled = false
        if (firstLoad) {
          firstLoad = false
        } else {
          boxPrice = boxPrice + parseInt(box.dataset.price)
          showSubTotal()
        }
        } else {
          form.querySelector('input[type="submit"]').disabled = true
          box.classList.remove('selected')
          boxPrice = boxPrice - parseInt(box.dataset.price)
          showSubTotal()
        }
        })
    })
    const selectedBox = document.querySelector("div[data-selected-box]").dataset.selectedBox
    if (selectedBox) {
      const selectedDiv = document.querySelector(`div[data-box-id="${selectedBox}"]`)
      setTimeout(() => {
      if (!selectedDiv.classList.contains('selected')) {
      selectedDiv.click()
      console.log(selectedDiv.classList)
      }
      }, 300)
    } else {
      form.querySelector('input[type="submit"]').disabled = true
    }
  }
}
const showSubTotal = () => {
  const subtotal = document.querySelector('#subtotal')
  if (subtotal) {
    if (boxPrice < 0) {
      boxPrice = 0
    }
    let amount = productsPrice + boxPrice
    subtotal.innerText = `${amount} ${currency}`
  }
}
export {initCart, showSubTotal}

