const initToggler= () => {
    const plus = document.querySelector("#plus");
    const minus = document.querySelector("#minus");
    const button = document.querySelector("#folder-btn");
    button.addEventListener("click", () => {
        plus.classList.toggle("d-none");
        minus.classList.toggle("d-none");
    })
}

export {initToggler};