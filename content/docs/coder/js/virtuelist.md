---
title: Virtual scroll list
---

```js
class List {
    constructor(opt) {
        this.el = opt.el;
        this.data = opt.data;
        this.viewH = opt.viewH;
        this.itemH = opt.itemH;
        this.totalH = this.data.length * this.itemH + 'px';
        this.list = [];
        this.offsetY = 0;
        this.showNum = 0;
        this.lastTime = new Date().getTime();

        this.el.style.height = this.viewH + 'px';
    }

    init() {
        this.composeDom();
        this.initData();
        this.bindEvent();
    }

    composeDom() {
        let totalBox = document.createElement('div'),
            listBox = document.createElement('div');
        totalBox.className = 'totalBox';
        totalBox.style.height = this.totalH;
        listBox.className = 'listBox';
        totalBox.append(listBox);
        this.el.append(totalBox);
        this.totalBox = totalBox;
        this.listBox = listBox;
    }

    initData() {
        this.showNum = Math.floor(this.viewH / this.itemH) + 4;
        this.list = this.data.slice(0, this.showNum);
        this.createByList(this.list);

    }

    createByList(list) {
        this.listBox.innerText = '';
        let fragment = document.createDocumentFragment();
        for (let i = 0; i < this.showNum; i++) {
            let div = document.createElement('div');
            div.style.height = this.itemH + 'px';
            div.innerText = list[i];
            fragment.append(div);
        }
        this.listBox.append(fragment);
    }

    bindEvent() {
        this.el.addEventListener('scroll', this.handleScroll.bind(this), false);
    }

    handleScroll(e) {
        if (new Date().getTime() - this.lastTime > 20) {
            let scrollTop = e.target.scrollTop,
                prevNum = Math.floor(scrollTop / this.itemH);
            this.offsetY = scrollTop - (scrollTop % this.itemH);
            this.list = this.data.slice(prevNum, prevNum + this.showNum);
            this.createByList(this.list);
            this.listBox.style.transform = `translateY(${this.offsetY}px)`
            this.lastTime = new Date().getTime();
        }

    }
}

new List({
    el: document.getElementById('list-dom'),
    data: Array.from({length: 999}).map((item, index) => index),
    viewH: 600,
    itemH: 40
}).init();
```