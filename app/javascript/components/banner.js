import Typed from 'typed.js';


const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Live","Love", "Fight"],
    typeSpeed: 50,
    loop: true
  });
}
export { loadDynamicBannerText };
