import {loadStripe} from '@stripe/stripe-js';

const paymentContainer = document.querySelector('#payment-container')
const form = document.getElementById('payment-form');
const submitButton = form.querySelector('button')
const spinner = document.querySelector('#payment-spinner');
const deliveryAddress = form.querySelector('#delivery_address')
const contactNumber = form.querySelector('#delivery_contact_number')

const initStripe = async () => {
  if (paymentContainer) {
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
    var displayError = document.getElementById('card-errors');
    if (event.error) {
      spinner.classList.add('d-none')
      submitButton.disabled = true
      displayError.textContent = event.error.message;
    } else {
      displayError.textContent = '';
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

function stripePaymentMethodHandler(result, email, order) {
  if (result.error) {
    // Show error in payment form
  } else {
    // Otherwise send paymentMethod.id to your server
    fetch('/api/v1/create_customer', {
      method: 'post',
      headers: {'Content-Type': 'application/json'},
      body: JSON.stringify({
        email,
        order_id: order,
        delivery_address: deliveryAddress.value,
        delivery_contact_number: contactNumber.value,
        payment_method: result.paymentMethod.id
      }),
    }).then(function(result) {
     return result.json();
    }).then(function(customer) {
      window.location.replace(`/orders/${order}`)
    });
  }
}

export {initStripe}
