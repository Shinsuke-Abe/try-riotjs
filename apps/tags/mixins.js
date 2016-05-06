// mixin
// オブジェクト
exports.OptsMixin = {
    // 特殊メソッド(riotの仕様？ミックスインしたタグ生成時に実行される)
    init: function() {
      this.on('updated', function() { console.log('Updated!') })
    },

    getOpts: function() {
        return this.opts
    },

    setOpts: function(opts, update) {
        this.opts = opts

        if(!update) {
            this.update()
        }

        return this
    }
}

// 関数
function IdMixin() {
    this.getId = function() {
        return this._id
    }
}

exports.id_mixin_instance = new IdMixin()