function showFooter() {
  const footer = document.getElementById("myFooterDynamique")
  footer.classList.toggle('invisible')
}

export function click() {
  const boutton = document.getElementById("versModalDynamique")
  const croix = document.getElementById("fermerDynamique")
  boutton.addEventListener('click', showFooter)
  croix.addEventListener('click', showFooter)
}

click();
