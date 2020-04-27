const nextButton = document.querySelector('.next-button')

const initSurvey = () => {

  if (nextButton) {
    document.addEventListener('click', (event) => {
      const sections = document.querySelectorAll('section.scroll-section')
      const activeSection = document.querySelector('section.scroll-section.active')
      const activeIndex = parseInt(activeSection.dataset.index)
      if (event.target.classList.contains('next-button') && sectionIsValid(activeSection)  ) {
      const nextSection = sections[activeIndex + 1]
      nextSection.classList.remove('d-none')
      nextSection.classList.add('d-flex', 'active')
      activeSection.classList.remove('d-flex', 'active')
      activeSection.classList.add('d-none')
      }
    } )
  }
}
const sectionIsValid = (activeSection) => {
  const inputs = activeSection.querySelectorAll('input')
    if (inputs[0].type === 'text') {
      return !!inputs[0].value.length
    }
    if (inputs[1].type === 'checkbox') {
      return !!activeSection.querySelectorAll('input[type="checkbox"]:checked').length
    }
    if (inputs[1].type === 'radio') {
      return !!activeSection.querySelectorAll('input[type="radio"]:checked').length
    }
}
export {initSurvey}
