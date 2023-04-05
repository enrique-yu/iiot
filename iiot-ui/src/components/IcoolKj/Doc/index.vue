<template>
  <div>
    <svg-icon icon-class="question" @click="goto" />
  </div>
</template>

<script>
export default {
  name: 'IcoolKjDoc',
  data() {
    return {
      url: 'http://doc.icoolkj.vip/icoolkj-vue'
    }
  },
  methods: {
    goto() {
      window.open(this.url)
    }
  }
}
</script>
