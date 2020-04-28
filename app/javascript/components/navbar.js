const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar');
  if (navbar) {
    let offsetTop
    const productsBanner = document.querySelector('#products-banner')
    if (productsBanner) {
      offsetTop = 50
    } else {
      const heroSection = document.querySelector('.hero-section');
      const rect = heroSection.getBoundingClientRect();
      offsetTop = rect.top + heroSection.offsetHeight;
  };
    window.addEventListener('scroll', () => {
      if (window.scrollY >= offsetTop) {
        navbar.classList.add('navbar-white');
      } else {
        navbar.classList.remove('navbar-white');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
