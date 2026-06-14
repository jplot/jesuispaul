// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

import 'popper'
import 'bootstrap'

// Ramène le contenu scrollable en haut au changement d'onglet (résumé) ou de slide (messages/articles)
function resetScroll(e) {
  const scroller = e.type.includes('tab')
    ? document.querySelector(e.target.dataset.bsTarget)?.closest('.tab-content')
    : e.relatedTarget?.querySelector('.message-text, .articles-list')
  if (scroller) scroller.scrollTop = 0
}
['shown.bs.tab', 'slide.bs.carousel'].forEach((evt) => document.addEventListener(evt, resetScroll))

// Carrousel vidéo : l'iframe n'a un src que pour le slide actif (lazy-load).
// Quitter un slide vide son iframe -> coupe net la vidéo, sans autoplay parasite.
const embedCarousel = document.querySelector('#embed-carousel')
if (embedCarousel) {
  const items = embedCarousel.querySelectorAll('.carousel-item')
  const load = (i) => {
    const iframe = items[i]?.querySelector('iframe')
    if (iframe && iframe.dataset.src && !iframe.getAttribute('src')) iframe.src = iframe.dataset.src
  }
  const unload = (i) => items[i]?.querySelector('iframe')?.removeAttribute('src')

  load([...items].findIndex((el) => el.classList.contains('active')))
  embedCarousel.addEventListener('slide.bs.carousel', (e) => {
    unload(e.from)
    load(e.to)
  })
}
