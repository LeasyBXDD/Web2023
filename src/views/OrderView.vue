<template>
    <van-back-top bottom="100px" />
    <van-notice-bar left-icon="volume-o" text="小众点评打卡本店即可获赠冰粉一份！仅限本周！" />
    <!-- <van-search v-model="value" placeholder="请输入搜索关键词" /> -->
    <!-- <van-search v-model="value" @change="changeInputValue" :focus="theFocus" placeholder="请输入菜品名称" @search="onSearch()" /> -->
    <van-row>
        <span style="margin-bottom: 10px;"></span>
    </van-row>
    <van-row>
        <van-tabs v-model:active="active" @click-tab="onClickTab" type="card" style="width: 100%;">
            <van-tab title="主食">
                <div style="width: 100%;">
                    <van-card v-for="(item, index) in dishes1" :key="index" :price="item.dish_price" :desc="item.dish_des"
                        :title="item.dish_name" :thumb="item.dish_img" :id="item.dish_id" :tags="item.dish_nutrition_id"
                        :num="item.number">
                        <template #thumb>
                            <img :src="item.dish_img" style="width: 100%; height: 100%;" />
                        </template>
                        <template #tags>
                            <!-- <van-tag v-for="(tag, index1) in tags" :key="index1" plain type="primary"> -->
                            <van-tag type="primary"> 销售量 {{ tags1[index].dish_weight }}</van-tag>
                            <!-- </van-tag> -->
                        </template>
                        <template #footer>
                            <van-button size="mini" type="primary" @click="addToCart(item)" round
                                :style="{ backgroundColor: backgroundColorYes }">来一份</van-button>
                            <van-button size="mini" type="danger" @click="removeFromCart(item)" round
                                :style="{ backgroundColor: backgroundColorNo }">不要了</van-button>
                            <!-- <van-button size="mini" type="primary" @click="addToCart(item)" round><van-icon
                                    name="plus" /></van-button>
                            <van-button size="mini" type="danger" @click="removeFromCart(item)" round><van-icon
                                    name="minus" /></van-button> -->
                        </template>
                    </van-card>
                </div>
            </van-tab>
            <van-tab title="川菜">
                <div style="width: 100%;">
                    <van-card v-for="(item, index) in dishes2" :key="index" :num="item.number" :price="item.dish_price"
                        :desc="item.dish_des" :title="item.dish_name" :thumb="item.dish_img" :id="item.dish_id">
                        <template #thumb>
                            <img :src="item.dish_img" style="width: 100%; height: 100%;" />
                        </template>
                        <template #tags>
                            <van-tag type="primary"> 销售量 {{ tags2[index].dish_weight }}</van-tag>
                        </template>
                        <template #footer>
                            <van-button size="mini" type="primary" @click="addToCart(item)" round
                                :style="{ backgroundColor: backgroundColorYes }">来一份</van-button>
                            <van-button size="mini" type="danger" @click="removeFromCart(item)" round
                                :style="{ backgroundColor: backgroundColorNo }">不要了</van-button>
                            <!-- <van-button size="mini" type="primary" @click="addToCart(item)">加入购物车</van-button>
                            <van-button size="mini" type="danger" @click="removeFromCart(item)">移除</van-button> -->
                        </template>
                    </van-card>
                </div>
            </van-tab>
            <van-tab title="粤菜">
                <div style="width: 100%;">
                    <van-card v-for="(item, index) in dishes3" :key="index" :num="item.number" :price="item.dish_price"
                        :desc="item.dish_des" :title="item.dish_name" :thumb="item.dish_img" :id="item.dish_id">
                        <template #thumb>
                            <img :src="item.dish_img" style="width: 100%; height: 100%;" />
                        </template>
                        <template #tags>
                            <van-tag type="primary"> 销售量 {{ tags3[index].dish_weight }}</van-tag>
                        </template>
                        <template #footer>
                            <van-button size="mini" type="primary" @click="addToCart(item)" round
                                :style="{ backgroundColor: backgroundColorYes }">来一份</van-button>
                            <van-button size="mini" type="danger" @click="removeFromCart(item)" round
                                :style="{ backgroundColor: backgroundColorNo }">不要了</van-button>
                            <!-- <van-button size="mini" type="primary" @click="addToCart(item)">加入购物车</van-button>
                            <van-button size="mini" type="danger" @click="removeFromCart(item)">移除</van-button> -->
                        </template>
                    </van-card>
                </div>
            </van-tab>
            <van-tab title="饮品">
                <div style="width: 100%;">
                    <van-card v-for="(item, index) in dishes4" :key="index" :num="item.number" :price="item.dish_price"
                        :desc="item.dish_des" :title="item.dish_name" :thumb="item.dish_img" :id="item.dish_id">
                        <template #thumb>
                            <img :src="item.dish_img" style="width: 100%; height: 100%;" />
                        </template>
                        <template #tags>
                            <van-tag type="primary"> 销售量 {{ tags4[index].dish_weight }}</van-tag>
                        </template>
                        <template #footer>
                            <van-button size="mini" type="primary" @click="addToCart(item)" round
                                :style="{ backgroundColor: backgroundColorYes }">来一份</van-button>
                            <van-button size="mini" type="danger" @click="removeFromCart(item)" round
                                :style="{ backgroundColor: backgroundColorNo }">不要了</van-button>
                            <!-- <van-button size="mini" type="primary" @click="addToCart(item)">加入购物车</van-button>
                            <van-button size="mini" type="danger" @click="removeFromCart(item)">移除</van-button> -->
                        </template>
                    </van-card>
                </div>
            </van-tab>
        </van-tabs>
    </van-row>

    <van-submit-bar :price="parseFloat(cartTotalPrice * 100)" button-text="提交订单" @submit="onSubmit"
        style="margin-bottom: 49px;" />

    <Nav></Nav>
</template>

<script>
import axios from 'axios';
import { ref } from 'vue';
import { showToast } from 'vant';
import Nav from '../components/Nav.vue'
import 'vant/es/pull-refresh/style'
import 'vant/es/tabbar/style'
import 'vant/es/tabbar-item/style'
import 'vant/es/config-provider/style'
import 'vant/es/row/style'
import 'vant/es/icon/style'
import 'vant/es/image/style'
import 'vant/es/button/style'
import 'vant/es/field/style'
import 'vant/es/search/style'
import 'vant/es/notice-bar/style'
import 'vant/es/sidebar/style'
import 'vant/es/sidebar-item/style'
import 'vant/es/action-bar/style'
import 'vant/es/action-bar-icon/style'
import 'vant/es/action-bar-button/style'
import 'vant/es/submit-bar/style'
import 'vant/es/checkbox/style'
import 'vant/es/checkbox-group/style'
import 'vant/es/stepper/style'
import 'vant/es/swipe-cell/style'
import 'vant/es/card/style'
import 'vant/es/tag/style'
import 'vant/es/tree-select/style'
import 'vant/es/back-top/style'
import 'vant/es/cell/style'
import 'vant/es/cell-group/style'
import 'vant/es/submit-bar/style'
import 'vant/es/nav-bar/style'
import 'vant/es/tabs/style'
import 'vant/es/tab/style'
import 'vant/es/overlay/style'
import 'vant/es/popup/style'
import 'vant/es/icon/style'

export default {
    components: {
        Nav,
    },
    setup() {
        const show = ref(false);
        const onClickOverlay = () => {
            showToast('click-overlay');
        };
        const onClickCloseIcon = () => {
            showToast('click-close-icon');
        };
        const value = ref('');
        const checked = ref(false);
        const active = ref(0);
        const onClickTab = ({ title }) => {
            console.log("选中", title);
        };

        return {
            show,
            onClickOverlay,
            onClickCloseIcon,
            value,
            checked,
            active,
            onClickTab,
        };
    },
    data() {
        return {
            tags1: [],
            tags2: [],
            tags3: [],
            tags4: [],
            cart: [], // define cart as an empty array
            cartTotalPrice: 0,
            cartTotalQuantity: 0,
            dishes1: [],
            dishes2: [],
            dishes3: [],
            dishes4: [],
            dish_id: 0,
            user_id: 1,
            name: '',
            img: '',
            dish_flavor: 1,
            amount: 0,
            theFocus: false,
            backgroundColorYes: '#1989fa',
            backgroundColorNo: '#ee0a24',
        };
    },
    methods: {
        changeBackgroundColorYes(color) {
            this.backgroundColorYes = color;
            this.backgroundColorNo = '#ee0a24';
        },
        changeBackgroundColorNo(color) {
            this.backgroundColorNo = color;
            this.backgroundColorYes = '#1989fa';
        },
        getTags1() {
            // 发送请求获取标签数据
            const id = 1; // replace with the correct category id
            axios.get(`http://localhost/web20230105/php/getDish.php?id=${id}`).then(response => {
                if (response.data[0].code === 1) {
                    this.tags1 = response.data[0].data;
                    console.log(this.tags1);
                }
            });
        },
        getTags2() {
            // 发送请求获取标签数据
            const id = 2; // replace with the correct category id
            axios.get(`http://localhost/web20230105/php/getDish.php?id=${id}`).then(response => {
                if (response.data[0].code === 1) {
                    this.tags2 = response.data[0].data;
                    console.log(this.tags2);
                }
            });
        },
        getTags3() {
            // 发送请求获取标签数据
            const id = 3; // replace with the correct category id
            axios.get(`http://localhost/web20230105/php/getDish.php?id=${id}`).then(response => {
                if (response.data[0].code === 1) {
                    this.tags3 = response.data[0].data;
                    console.log(this.tags3);
                }
            });
        },
        getTags4() {
            // 发送请求获取标签数据
            const id = 4; // replace with the correct category id
            axios.get(`http://localhost/web20230105/php/getDish.php?id=${id}`).then(response => {
                if (response.data[0].code === 1) {
                    this.tags4 = response.data[0].data;
                    console.log(this.tags4);
                }
            });
        },
        getDishes1() {
            const id = 1; // replace with the correct category id
            axios.get(`http://localhost/web20230105/php/getDish.php?id=${id}`).then(response => {
                if (response.data[0].code === 1) {
                    this.dishes1 = response.data[0].data;
                }
            });

            axios.get(`http://localhost/web20230105/php/getShopping.php?id=${id}`)
                .then(response => {
                    console.log(response.data);
                    for (let i = 0; i < this.dishes1.length; i++) {
                        this.dishes1[i].number = 0;
                    }
                    // this.dishes1 += response.data
                    console.log('现在的内容', this.dishes1);
                })
                .catch(error => {
                    console.log(error);
                });

            // Promise.all([getDishPromise, getShoppingPromise]).then(() => {
            //     // 两个请求都完成后执行的操作
            //     console.log('两个请求都完成了');
            // });
        },
        getDishes2() {
            const id = 2; // replace with the correct category id
            axios.get(`http://localhost/web20230105/php/getDish.php?id=${id}`).then(response => {
                if (response.data[0].code === 1) {
                    this.dishes2 = response.data[0].data;
                }
            });

            axios.get(`http://localhost/web20230105/php/getShopping.php?id=${id}`)
                .then(response => {
                    console.log(response.data);
                    for (let i = 0; i < this.dishes2.length; i++) {
                        this.dishes2[i].number = 0;
                    }
                    // this.dishes1 += response.data
                    // console.log('现在的内容', this.dishes1);
                })
                .catch(error => {
                    console.log(error);
                });
        },
        getDishes3() {
            const id = 3; // replace with the correct category id
            axios.get(`http://localhost/web20230105/php/getDish.php?id=${id}`).then(response => {
                if (response.data[0].code === 1) {
                    this.dishes3 = response.data[0].data;
                }
            });

            axios.get(`http://localhost/web20230105/php/getShopping.php?id=${id}`)
                .then(response => {
                    console.log(response.data);
                    for (let i = 0; i < this.dishes3.length; i++) {
                        this.dishes3[i].number = 0;
                    }
                    // this.dishes1 += response.data
                    // console.log('现在的内容', this.dishes1);
                })
                .catch(error => {
                    console.log(error);
                });
        },
        getDishes4() {
            const id = 4; // replace with the correct category id
            axios.get(`http://localhost/web20230105/php/getDish.php?id=${id}`).then(response => {
                if (response.data[0].code === 1) {
                    this.dishes4 = response.data[0].data;
                }
            });

            axios.get(`http://localhost/web20230105/php/getShopping.php?id=${id}`)
                .then(response => {
                    console.log(response.data);
                    for (let i = 0; i < this.dishes4.length; i++) {
                        this.dishes4[i].number = 0;
                    }
                    // this.dishes1 += response.data
                    // console.log('现在的内容', this.dishes1);
                })
                .catch(error => {
                    console.log(error);
                });
        },
        addToCart(dish) {
            console.log("dish", dish)
            // convert dish price to number
            dish.dish_price = parseFloat(dish.dish_price);

            console.log(dish.dish_id, dish.dish_name, dish.dish_price, dish.dish_img, dish.dish_flavor, dish.amount);
            // add dish to cart
            this.cart.push(dish);
            this.cartTotalPrice += dish.dish_price;
            this.cartTotalQuantity++;

            // add dish to cart
            // this.cart.push({
            //     dish_id: dish.dish_id,
            //     user_id: this.user_id,
            //     name: dish.name,
            //     img: this.img,
            //     dish_flavor: this.dish_flavor,
            //     amount: this.amount,
            // });

            // save cart data to local storage
            localStorage.setItem('cart', JSON.stringify(this.cart));
            localStorage.setItem('cartTotalPrice', this.cartTotalPrice);
            localStorage.setItem('cartTotalQuantity', this.cartTotalQuantity);

            // 给数据库中的dish表中的dish_weight字段加1
            axios.get('http://localhost/web20230105/php/updateShopping.php', {
                params: {
                    number: 1,
                    amount: dish.dish_price,
                    // dish_flavor: dish.dish_flavor,
                    // dish_id: dish.dish_id,
                    // 数据库中数据缺失，暂时用1代替
                    user_id: 1,
                    dish_flavor: 1,
                    dish_id: 3,
                },
            }).then(response => {
                // 在赋值之后判断 dish.number 的值
                if (dish.number !== 1 && dish.number !== 0) {
                    dish.number = 0;
                }
                if (response.data[0].code === 1) {
                    // 给数据库中的dish表中的dish_weight字段加1
                    dish.dish_weight += 1;
                    console.log("dish1:", dish);

                    dish.number += 1;
                    // 在前端页面给number加1
                    console.log('add dish weight successfully');
                }
            });

            // send GET request
            axios.get(`http://localhost/web20230105/php/addShopping.php`
                , {
                    params: {
                        dish_id: this.cart[0].dish_id,
                        user_id: this.user_id,
                        name: this.cart[0].dish_name,
                        img: this.cart[0].dish_img,
                        dish_flavor: "888",
                        amount: "999",
                    },
                })
                .then(response => {
                    // console.log(response.data);
                    console.log('add shopping successfully');
                    showToast('添加成功');
                })
                .catch(error => {
                    console.log(error);
                });

            // 前端显示的价格回归原样
            dish.dish_price = dish.dish_price.toFixed(2);

        },
        removeFromCart(dish) {
            // 删除
            // convert dish price to number, 保存最后的两位小数
            dish.dish_price = parseFloat(dish.dish_price);

            // remove dish from cart
            this.cart.splice(this.cart.indexOf(dish), 1);
            this.cartTotalPrice -= dish.dish_price;
            this.cartTotalQuantity--;

            // save cart data to local storage
            localStorage.setItem('cart', JSON.stringify(this.cart));
            localStorage.setItem('cartTotalPrice', this.cartTotalPrice);
            localStorage.setItem('cartTotalQuantity', this.cartTotalQuantity);

            // 给数据库中的dish表中的dish_weight字段减1
            axios.get('http://localhost/web20230105/php/updateShopping.php', {
                params: {
                    number: dish.number - 1,
                    amount: dish.dish_price,
                    // dish_flavor: dish.dish_flavor,
                    // dish_id: dish.dish_id,
                    // 数据库中数据缺失，暂时用1代替
                    user_id: 1,
                    dish_flavor: 1,
                    dish_id: 3,
                },
            }).then(response => {
                if (response.data[0].code === 1) {
                    // 给数据库中的dish表中的dish_weight字段减1
                    dish.dish_weight -= 1;
                    console.log("dish1:", dish);
                    showToast('删除成功');
                    dish.number -= 1;
                    // 在前端页面给number减1
                    console.log('add dish weight successfully');
                }
            });

            // 前端显示的价格回归原样
            dish.dish_price = dish.dish_price.toFixed(2);

        },
        onSubmit() {
            // check if cart is empty, if yes, show alert and return, if no, route to State page
            if (this.cart.length === 0) {
                console.log('cart is empty');
                showToast('购物车为空');
                return;
            } else {

                // clear cart
                this.cart = [];
                this.cartTotalPrice = 0;
                this.cartTotalQuantity = 0;

                this.$router.push('/state');
            }
        },
        toSearch() {
            // 查找页面中value的位置
            let index = 0;
            for (let i = 0; i < this.listdata.length; i++) {
                if (this.listdata[i].name === this.value) {
                    index = i;
                    break;
                }
            }
            if (this.listdata[index] !== undefined) {
                this.$router.push({ path: '/detail', query: { id: this.listdata[index].id } }); // 跳转到详情页
            }
        },
        saveHistory(value) {
            // 保存搜索历史
            let history = localStorage.getItem('history');
            if (history === null) {
                history = [];
            } else {
                history = JSON.parse(history);
            }
            if (history.indexOf(value) === -1) {
                history.push(value);
            }
            localStorage.setItem('history', JSON.stringify(history));
        },
        changeInputValue(e) {
            let value = e.detail.value;
            if (value !== undefined && value.length > 0) {
                this.historyShow = true;
            }
            this.value = value;
            console.log(this.value);
        },
        onSearch() {
            console.log(this.value);
            // 查找页面中value的位置
            // this.listdata = [];
            // this.toSearch();
            // this.totalPages = 0;
            // this.pageNumber = 1;
            // this.saveHistory(this.value);
        },
    },
    mounted() {
        this.getTags1();
        this.getTags2();
        this.getTags3();
        this.getTags4();
        this.getDishes1();
        this.getDishes2();
        this.getDishes3();
        this.getDishes4();
    },
};
</script>