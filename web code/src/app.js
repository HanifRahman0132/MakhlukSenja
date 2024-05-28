document.addEventListener('alpine:init', () => {
    Alpine.data('products', () => ({
        items:[
            {id: 1, name: 'WHISKAS +2 Dry Food', img: 'products/menu_adult_dry.png', price: 44000},
            {id: 2, name: 'WHISKAS Dry Food with Ocean Fish Flavor with milk', img: 'products/2.png', price: 30000},
            {id: 3, name: 'WHISKAS Wet Food With Chicken Mince', img: 'products/3.png', price: 51500},
            {id: 4, name: 'WHISKAS Wet Food With Beef Casserole', img: 'products/4.png', price: 53000},
            {id: 5, name: 'WHISKAS Wet Food With Chicken Gravy', img: 'products/5.png', price: 10000},
            {id: 6, name: 'WHISKAS Wet Food Fish Selection(80x)', img: 'products/6.png', price: 260000},
        ],
    }));

    Alpine.store('cart', {
        items: [],
        total : 0,
        quantity: 0,
        add(newItem) {
            //check is there the same items on the cart
            const cartItem = this.items.find((item) => item.id === newItem.id);

            //if there's no item / cart still empty
            if(!cartItem) {
                this.items.push({...newItem, quantity: 1, total: newItem.price});
                this.quantity++;
                this.total += newItem.price;
            } else {
                //if there's item, check if there any different item on the cart
            this.items = this.items.map((item) => {
            //if the items are different
                if(item.id !== newItem.id){
                    return item;
                }else {
                //if there're already items on the cart, add the quantity and the total amount
                item.quantity++;
                        item.total = item.price * item.quantity;
                        this.quantity++;
                        this.total += item.price;
                        return item;
                    }
                });
            }          
        },
        remove(id) {
            //take any items that want to be remove based on id
            const cartItem = this.items.find((item) => item.id === id);

            //if more than 1
            if(cartItem.quantity>1){
                //search one by one
                this.items = this.items.map((item) => {
                    //if not the choosen items
                    if(item.id !== id) {
                        return item;
                    }else{
                        item.quantity--;
                        item.total = item.price *item.quantity;
                        this.quantity--;
                        this.total -= item.price;
                        return item;
                    }
                })
            }
            else if(cartItem.quantity === 1) {
                //if there's only 1 left item 
                this.items = this.items.filter((item) => item.id !== id);
                this.quantity--;
                this.total -= cartItem.price;
            }
        }
    });
});


//rupiah conversion
const rupiah = (number) => {
    return new Intl.NumberFormat('id-ID', {
        style: 'currency',
        currency: 'IDR',
        minimumFractionDigits: 0
    }).format(number);
};

