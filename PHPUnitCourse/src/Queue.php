<?php


class Queue{

    /**
     * @var array
     */
    protected $items =[];

    public function push($item){
        $this->items[] = $item;
    }

    public function pop(){
        return array_pop($this->items);
    }

    public function getCount(){
        return count($this->items);
    }

}

