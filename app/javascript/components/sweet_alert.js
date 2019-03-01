import swal from 'sweetalert';

function bindSweetAlertButtonDemo() {
  const swalButton = document.getElementById('sweet-alert-demo');
  if (swalButton) {
    swal({
        title: "Successfully added!",
        text: "Your memory has been successfully added",
        icon: "success"
      })
  }
}

export { bindSweetAlertButtonDemo };
