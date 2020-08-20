import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Find your Dave in a few clicks", "Your project deserves it","Vanina rappelle-toi","Que je ne suis-rien sans toi"],
    typeSpeed: 45,
    loop: true
  });
}

export { loadDynamicBannerText };