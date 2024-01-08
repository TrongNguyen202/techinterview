
import './output.css';
import Header from './components/Header';
import ProductDetail from './components/ProductDetail';
import NavInfor from './components/NavInfor';
import PriceCompare from './components/PriceCompare';
import PriceHistoryChart from './components/PriceHistoryChart';
import Chart from "chart.js/auto";
import { CategoryScale } from "chart.js";
import ProductDescription from './components/ProductDescription';
import Reviews from './components/Reviews';
Chart.register(CategoryScale);
function App() {
  return (
    <div className="App">
     
      <Header/>
      <ProductDetail/>
      <NavInfor/>
      <PriceCompare/>
      <div className='w-[1000px] '>
      <PriceHistoryChart/>
      </div>
      <ProductDescription/>
      <Reviews/>
      
    </div>
  );
}

export default App;
