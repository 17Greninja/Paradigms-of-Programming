class Calc{

    public int arr[];
    public int MAX_VAL = 1000000007;
    public int current_capacity;

    Calc(int size){
        arr = new int[size];
        current_capacity = 0;
    }

    public void push(String number){
        int num = Integer.parseInt(number);
        arr[current_capacity] = num;
        current_capacity++;
    }

    public void popWithPrint(){
        if(current_capacity!=0){
            System.out.print(arr[current_capacity-1]);
            System.out.print("\n");
            current_capacity--;
        }
    }

    public void pop(){
        if(current_capacity!=0){
            current_capacity--;
        }  
    }

    public void dup(){
        if(current_capacity == 0)return;
        int top = arr[current_capacity-1];
        push(Integer.toString(top));
    }

    public void add(){
        if(current_capacity<2)return;
        int top1 = arr[current_capacity-1];
        int top2 = arr[current_capacity-2];
        pop();
        pop();
        push(Integer.toString(top1+top2));
    }

    public void sub(){
        if(current_capacity<2)return;
        int top1 = arr[current_capacity-1];
        int top2 = arr[current_capacity-2];
        pop();
        pop();
        push(Integer.toString(top1-top2));
    }

    public void mul(){
        if(current_capacity<2)return;
        int top1 = arr[current_capacity-1];
        int top2 = arr[current_capacity-2];
        pop();
        pop();
        push(Integer.toString(top1*top2));
    }

    public void div(){
        if(current_capacity<2)return;
        int top1 = arr[current_capacity-1];
        int top2 = arr[current_capacity-2];
        pop();
        pop();
        push(Integer.toString(top1/top2));
    }

    public void performOperations(String [] operations){
        for(int i=0;i<operations.length;i++){
            switch (operations[i]){
                case "push":
                    push(operations[i+1]);
                    break;
                case "pop":
                    popWithPrint();
                    break;
                case "dup":
                    dup();
                    break;
                case "add":
                    add();
                    break;
                case "sub":
                    sub();
                    break;
                case "mul":
                    mul();
                    break;
                case "div":
                    div();
                    break;
                default:
                    break;
            }
        }
        return;
    }
    public static void main(String args[]){
        Code testcase = new Code();
        String []operations = testcase.code;
        int size = operations.length;
        Calc st = new Calc(size);
        st.performOperations(operations);
    }
}  