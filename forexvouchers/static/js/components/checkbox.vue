<template>
  <div>
    <b-form-checkbox
      v-model="status"
      name="checkbox-1"
      value="accepted"
      unchecked-value="not_accepted"
    >
    </b-form-checkbox>

  </div>
</template>

<script>
  export default {
    name: "checkbox-for-compare",
    data() {
      return {
        status: 'not_accepted'
      }
    }
  }
</script>