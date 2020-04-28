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
        } else {
          box.classList.remove('selected')
        }
        })
    })
  }
}
export {initCart}
