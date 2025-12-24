<template>
  <div v-html="decodeURI(query.body)"></div>
</template>

<script setup>
import { useRoute } from 'vue-router'

const { query } = useRoute()

setTimeout(() => {
  document.forms[0]?.submit()
}, 100)
</script>

<style lang="scss" scoped></style>
