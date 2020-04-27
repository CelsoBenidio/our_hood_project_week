const nextButton = document.querySelector('#next-button')

const initSurvey = () => {

  if (nextButton) {
    nextButton.addEventListener('click', () => {
      console.log(nextButton)
    } )
  }
}

export {initSurvey}
