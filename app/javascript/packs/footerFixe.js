function showFooter() {
  const footer = document.getElementById("myFooterFixe")
  footer.classList.toggle('invisible')
}

export function click() {
  const boutton = document.getElementById("versModalFixe")
  const croix = document.getElementById("fermerFixe")
  boutton.addEventListener('click', showFooter)
  croix.addEventListener('click', showFooter)
}

click();
