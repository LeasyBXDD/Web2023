<template>
    <van-tabbar v-model="active" route>
        <van-tabbar-item icon="shopping-cart-o" replace to="/order">点餐</van-tabbar-item>
        <van-tabbar-item icon="home-o" replace to="/state">状态</van-tabbar-item>
        <van-tabbar-item icon="contact" replace to="/myinfo">我的</van-tabbar-item>
    </van-tabbar>
</template>

<script>
import { ref } from 'vue';
import 'vant/es/tabbar/style'
import 'vant/es/tabbar-item/style'


export default {
    setup() {
        const active = ref(0);
        const icon = {
            active: 'https://fastly.jsdelivr.net/npm/@vant/assets/user-active.png',
            inactive:
                'https://fastly.jsdelivr.net/npm/@vant/assets/user-inactive.png',
        };
        return {
            icon,
            active,
        };
    },
};


</script>

<style scoped></style>