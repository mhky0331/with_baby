import { Controller } from 'stimulus'

export default class extends Controller {
  toHref(event) {
    event.preventDefault()
    const href = event.currentTarget.dataset['href']
    window.location.href = href
  }
  enterToHref(event) {
    if (event.target !== event.currentTarget) return

    if (event.key === 'Enter') {
      this.toHref(event)
    }
  }
}