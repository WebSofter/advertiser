<template>
    <div class="app-footer">
        <div class="app-footer__inner">
            <div class="app-footer-right">
                <p class="app-footer-right__coopyright">@2020 SlotsBand</p>
            </div>
        </div>
    </div>
</template>

<script>

    import { library } from "@fortawesome/fontawesome-svg-core";
    import { faEllipsisV } from "@fortawesome/free-solid-svg-icons";

    library.add(faEllipsisV);
    export default {
        name: "Footer",
        components: {
        }
    };
</script>

<style>
    .app-footer-right__coopyright {
        margin: 0;
        color: #6c757d;
    }
</style>
