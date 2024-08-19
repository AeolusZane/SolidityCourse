class Foo {
    foo() {
        console.log("foo", this.bar);
    }
}
const foo = new Foo();
foo.foo();

foo.foo.call({
    bar: 42
})