// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

import 'popper'
import 'bootstrap'

// Au changement d'onglet, ramène le contenu scrollable en haut
document.addEventListener('shown.bs.tab', (e) => {
  const pane = document.querySelector(e.target.dataset.bsTarget)
  const scroller = pane?.closest('.tab-content')
  if (scroller) scroller.scrollTop = 0
})

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
