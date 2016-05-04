// mixin
// オブジェクト
var OptsMixin = {
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

var id_mixin_instance = new IdMixin()

<app>
    <!-- レイアウト -->
    <h1>App1 expressions</h1>
    <ul>
        <li>{ name }</li>
        <li>{ title || "タイトルないよー" }</li>
        <li>{ flag ? 'ready' : 'loading'}</li>
        <li>{ new Date() }</li>
        <li>{ Math.round(64.5) }</li>
    </ul>
    
    // ロジック(scriptタグ省略。プリプロセッサを指定する場合は必要)
    this.name = 'my title';
    this.flag = true;
</app>

<app2>
    <!-- レイアウト -->
    <h1>App2 loop</h1>
    <ul>
        <li each='{list}' class='{done:status}'>{ title }</li>
    </ul>
    
    <style>
        li.done {
            color: #aaa;
            text-decoration: line-through;
        }
    </style>
    
    // ロジック(scriptタグ省略。プリプロセッサを指定する場合は必要)
    this.list = [
        {
            title: 'Hello world!',
            status: false,
        },
        {
            title: '牛乳を買う',
            status: true,
        },
        {
            title: '豚肉を買う',
            status: false,
        }
    ];
</app2>

<app3>
    <!-- レイアウト -->
    <h1>Event Handlers</h1>
    
    <button onclick='{click}'>click</button>
    
    <ul>
        <li each='{list}'>
            <button onclick='{clickItem}'>{name}</button>
        </li>
    </ul>
    
    // ロジック(scriptタグ省略。プリプロセッサを指定する場合は必要)
    this.list = [
        {name: 'hoge'},
        {name: 'foo'},
        {name: 'bar'},
    ];
    
    this.click = function() {
        console.log('click された');
    };
    
    this.clickItem = function(e) {
        console.log(e.item.name + 'が click された');
    };
</app3>

<app4>
    <!-- レイアウト -->
    <h1>Form</h1>
    
    <form onsubmit='{submit}'>
        <input type='text' name='username' />
        <input type='password' name='password' />
        <button type='submit' name='submit'>login</button>
    </form>
    
    // ロジック
    this.on('mount', function() { // mount実行時にイベント追加
        this.username.value = 'shinsuke';
        this.password.value = 'hogefuga';
    });
    
    this.submit = function() {
        console.log("username: ", this.username.value);
        console.log("password: ", this.password.value);
    };
</app4>

<app5>
    <!-- レイアウト -->
    <h1>if/show/hide</h1>
    
    <button onclick={toggle}>click</button>
    <div if={look}> look </div>
    <div show={look}> show </div>
    <div hide={look}> hide </div>
    
    // ロジック
    this.look = true;
    this.toggle = function() {
        this.look = !this.look;
    }
</app5>

<app6>
    <!-- レイアウト -->
    <h1>{title}</h1>
    <style scoped>
        :scope h1 {
            color: red;
        }
    </style>
    
    // ロジック
    this.mixin(OptsMixin, id_mixin_instance);
    this.title = opts.title; // タグ指定時の引数
</app6>