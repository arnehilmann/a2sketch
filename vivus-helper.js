function displayAll(delay) {
    delay = delay || 200
    return (elem) => {
        const pathes = elem.el.getElementsByTagName("path")
        let count = 0
        for (let i=0; i<pathes.length; i++) {
            if (pathes[i].getAttribute("display") === "none") {
                setTimeout(() => {pathes[i].removeAttribute("display")}, delay * count)
                count++
            }
        }
    }
}
