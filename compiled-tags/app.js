riot.tag2('app', '<h1>App1 expressions</h1> <ul> <li>{name}</li> <li>{title || ⁗タイトルないよー⁗}</li> <li>{flag ? \'ready\' : \'loading\'}</li> <li>{new Date()}</li> <li>{Math.round(64.5)}</li> </ul>', '', '', function(opts) {


    this.name = 'my title';
    this.flag = true;
});

riot.tag2('app2', '<h1>App2 loop</h1> <ul> <li each="{list}" class="{done:status}">{title}</li> </ul>', 'li.done { color: #aaa; text-decoration: line-through; }', '', function(opts) {


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
});

riot.tag2('app3', '<h1>Event Handlers</h1> <button onclick="{click}">click</button> <ul> <li each="{list}"> <button onclick="{clickItem}">{name}</button> </li> </ul>', '', '', function(opts) {


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
});

riot.tag2('app4', '<h1>Form</h1> <form onsubmit="{submit}"> <input type="text" name="username"> <input type="password" name="password"> <button type="submit" name="submit">login</button> </form>', '', '', function(opts) {


    this.on('mount', function() {
        this.username.value = 'shinsuke';
        this.password.value = 'hogefuga';
    });

    this.submit = function() {
        console.log("username: ", this.username.value);
        console.log("password: ", this.password.value);
    };
});

riot.tag2('app5', '<h1>if/show/hide</h1> <button onclick="{toggle}">click</button> <div if="{look}"> look </div> <div show="{look}"> show </div> <div hide="{look}"> hide </div>', '', '', function(opts) {


    this.look = true;
    this.toggle = function() {
        this.look = !this.look;
    }
});

riot.tag2('app6', '<h1>{title}</h1>', 'app6 h1,[riot-tag="app6"] h1,[data-is="app6"] h1{ color: red; }', '', function(opts) {


    this.title = opts.title;
});