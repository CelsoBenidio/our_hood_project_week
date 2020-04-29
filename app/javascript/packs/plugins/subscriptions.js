import {loadStripe} from '@stripe/stripe-js';

function stripeTokenHandler(token) {
  // Insert the token ID into the form so it gets submitted to the server
  var form = document.getElementById('payment-form');
  var hiddenInput = document.createElement('input');
  hiddenInput.setAttribute('type', 'hidden');
  hiddenInput.setAttribute('name', 'stripeToken');
  hiddenInput.setAttribute('value', token.id);
  form.appendChild(hiddenInput);
  ["brand", "exp_month", "exp_year", "last4"].forEach(function(field) {
    addFieldToForm(form, token, field);
  });
 // Submit the form
 form.submit();
}
function addFieldToForm(form, token, field) {
  var hiddenInput = document.createElement('input');
  hiddenInput.setAttribute('type', 'hidden');
  hiddenInput.setAttribute('name', "user[card_" + field + "]");
  hiddenInput.setAttribute('value', token.card[field]);
  form.appendChild(hiddenInput);
}

const paymentContainer = document.querySelector('#payment-container')

const initStripe = async () => {
  if (paymentContainer) {
  const public_key = document.querySelector("meta[name='stripe-public-key']").content;
  const stripe = await loadStripe(public_key);
  const elements = stripe.elements();
  // Create a token or display an error when the form is submitted.
  const form = document.getElementById('payment-form');
  const spinner = document.querySelector('#payment-spinner')
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
      displayError.textContent = event.error.message;

    } else {
      displayError.textContent = '';
    }
  });

  form.addEventListener('submit', async (event) => {
    event.preventDefault()

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
