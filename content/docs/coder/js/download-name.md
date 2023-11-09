---
title: Get download file name
---

### Get name from response header

```js
let filename = ''

const res = await request(uri, {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
  },
  responseType: 'arrayBuffer',
  responseType: "blob",
  getResponse: true,
  data: params,
}).then((res) => {
  try {
    const disposition = res.response.headers.get('content-disposition');
    filename = disposition
      ? decodeURIComponent(disposition.split(';')[1].split("filename*=utf-8''")[1])
      : ''
  } catch (e) { }
  return res.data
})

if (!res) return

const blob = new Blob([res], {
  type: 'application/vnd.ms-excel',
})
const link = document.createElement('a')
const href = window.URL.createObjectURL(blob)
link.href = href

if (filename) {
  link.download = filename
}

document.body.appendChild(link)
link.click()
document.body.removeChild(link)
window.URL.revokeObjectURL(href)
```