const replaceLabelWithDiv = () => {
  const radioButtons = document.querySelectorAll('.section--radio input.radio_buttons')

  radioButtons.forEach((radioButton) => {
    const parent = radioButton.parentNode
    const label = parent.querySelector('label')

    const labelText = label.innerText

    const newDiv = document.createElement('div')
    newDiv.classList.add('radio-tile')
    newDiv.innerHTML = `<label>${labelText}</label>`

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

export { replaceLabelWithDiv, replaceFieldsetWithDiv }
