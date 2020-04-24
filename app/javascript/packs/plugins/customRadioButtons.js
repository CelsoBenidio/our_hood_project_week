const replaceLabelWithDiv = () => {
  const checkBoxes = document.querySelectorAll('.section--radio input.check_boxes')
  const radioButtons = document.querySelectorAll('.section--radio input.radio_buttons')

  checkBoxes.forEach((checkBox) => {
    const parent = checkBox.parentNode
    const label = parent.querySelector('label')

    const labelText = label.innerText

    const newDiv = document.createElement('div')
    newDiv.classList.add('radio-tile')
    newDiv.innerHTML = `<label class="tile--label">${labelText}</label>`

    parent.replaceChild(newDiv, label)
  })

  radioButtons.forEach((radioButton) => {
    const parent = radioButton.parentNode
    const label = parent.querySelector('label')

    const labelText = label.innerText

    const newDiv = document.createElement('div')
    newDiv.classList.add('radio-tile')
    newDiv.innerHTML = `<label class="tile--label">${labelText}</label>`

    parent.replaceChild(newDiv, label)
  })
}

const replaceFieldsetWithDiv = () => {
  const fieldsets = document.querySelectorAll('.section--radio fieldset')

  fieldsets.forEach((fieldset) => {
    const parent = fieldset.parentNode

    const html = fieldset.innerHTML
    const classes = fieldset.className.split(' ')

    const newDiv = document.createElement('div')
    newDiv.classList.add(...classes)

    newDiv.innerHTML = html

    parent.replaceChild(newDiv, fieldset)
  })
}

const handleCheckboxState = () => {
  window.addEventListener('click', (e) => {
    if (e.target.classList.contains('radio-tile')) {
      e.preventDefault()
      e.stopPropagation()

      const checkbox = e.target.parentNode.querySelector('input')
      checkbox.checked = !checkbox.checked
    } else if (e.target.classList.contains('tile--label')) {
      e.preventDefault()
      e.stopPropagation()

      const checkbox = e.target.parentNode.parentNode.querySelector('input')
      checkbox.checked = !checkbox.checked
    }
  })
}

// ----------------------------------------------------------------------------------



export { replaceLabelWithDiv, replaceFieldsetWithDiv, handleCheckboxState }
