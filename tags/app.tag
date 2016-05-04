<app>
    <h1>App1 expressions</h1>
    <ul>
        <li>{ name }</li>
        <li>{ title || "タイトルないよー" }</li>
        <li>{ flag ? 'ready' : 'loading'}</li>
        <li>{ new Date() }</li>
        <li>{ Math.round(64.5) }</li>
    </ul>
    
    this.name = 'my title';
    this.flag = true;
</app>

<app2>
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