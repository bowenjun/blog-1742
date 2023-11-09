---
title: <body> class change
---

```js
const bodyElement = document.querySelector('body');

const classChangeCallback = (mutationsList, observer) => {
    mutationsList.forEach((mutation) => {
        if (mutation.type === 'attributes' && mutation.attributeName === 'class') {
            console.log('body class is update:', bodyElement.classList);
        }
    });
};

const observer = new MutationObserver(classChangeCallback);

const observerConfig = {
    attributes: true,
    attributeFilter: ['class'],
};

observer.observe(bodyElement, observerConfig);

document.getElementById('add-class-btn').addEventListener('click', () => {
    bodyElement.classList.add('new-class');
});

document.getElementById('remove-class-btn').addEventListener('click', () => {
    bodyElement.classList.remove('new-class');
});
```