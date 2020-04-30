import {loadStripe} from '@stripe/stripe-js';

const paymentContainer = document.querySelector('#payment-container')
const form = document.getElementById('payment-form');
let submitButton
let spinner
let deliveryAddress
let contactNumber
let displayError

const initStripe = async () => {
  if (paymentContainer) {
    submitButton = form.querySelector('button')
    spinner = document.querySelector('#payment-spinner');
    deliveryAddress = form.querySelector('#delivery_address')
    contactNumber = form.querySelector('#delivery_contact_number')
    displayError = document.getElementById('card-errors');
    const public_key = document.querySelector("meta[name='stripe-public-key']").content;
    const stripe = await loadStripe(public_key);
    const elements = stripe.elements();

  // Custom styling can be passed to options when creating an Element.
  const style = {
    base: {
      // Add your base input styles here. For example:
      fontSize: '18px',
    }
  };

  // Create an instance of the card Element
  const card = elements.create('card', {style: style});
  // Add an instance of the card Element into the `card-element` <div>
  card.mount('#card-element');
  // card.mount('#example1-card');
  card.addEventListener('change', function(event) {
    if (event.error) {
      spinner.classList.add('d-none')
      submitButton.disabled = true
      displayError.textContent = event.error.message;
      displayError.classList.remove('d-none')
    } else {
      displayError.textContent = '';
      displayError.classList.add('d-none')
      submitButton.disabled = false
    }
  });

  form.addEventListener('submit', async (event) => {
    event.preventDefault()

    if (form.checkValidity()) {
      spinner.classList.remove('d-none')

      const email = paymentContainer.dataset.user
      const order = paymentContainer.dataset.order

      const result = await stripe.createPaymentMethod({
        type: 'card',
        card: card,
        billing_details: {
          email, // equivalent to email: email
        },
      })

      stripePaymentMethodHandler(result, email, order);
    } else {
      form.classList.add('was-validated')
    }
  })
}
}

async function stripePaymentMethodHandler(result, email, order) {
  if (result.error) {
    console.log(result.error);
  } else {
    // Otherwise send paymentMethod.id to your server
    try {
      const response = await fetch('/api/v1/create_customer', {
        method: 'post',
        headers: {'Content-Type': 'application/json'},
        body: JSON.stringify({
          email,
          order_id: order,
          delivery_address: deliveryAddress.value,
          delivery_contact_number: contactNumber.value,
          payment_method: result.paymentMethod.id
        }),
      })
      const data = await response.json();

      if (data.error){
        displayError.textContent = data.error.message;
        spinner.classList.add('d-none')
        displayError.classList.remove('d-none')
      } else {
        window.location.replace(`/orders/${order}`)
      }
    } catch(error){
      console.log(error)
    }
  }
}

export {initStripe}
